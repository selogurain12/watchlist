import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateMeDto } from './dto/create-me.dto';
import { UpdateMeDto } from './dto/update-me.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Stats } from './entities/me.entity';
import { In, Repository } from 'typeorm';
import { User } from '../users/entities/user.entity';

@Injectable()
export class MeService {
  constructor(
    @InjectRepository(Stats)
    public readonly meRepository: Repository<Stats>,
    @InjectRepository(User)
    public readonly userRepository: Repository<User>,
  ){}
  
  async create(createMeDto: CreateMeDto) {
    const existingStats = await this.meRepository.findOne({
      where: {
        user: { id: createMeDto.user.id }
      }
    })
    if(existingStats){
      throw new ConflictException("This user have already stats")
    }
    const stats = {
      user: createMeDto.user,
      filmsvu: 0,
        tempsvu: 0,
        livreslu: 0,
        pageslu: 0
    }
    const savestats = this.meRepository.create(stats);
    const savedStats = await this.meRepository.save(savestats)

    return savedStats;
  }

  async me(user: User) {
    const existingUser = await this.userRepository.findOne({
      where: {
        username: user.username
      }
    })
    if(!existingUser){
      throw new NotFoundException('This user dosen\'t exist')
    }
    const existingStats = await this.meRepository.findOne({
      where: {
        user: {id: user.id},
      }
    })
    if(!existingStats){
      throw new NotFoundException('This stats dosen\'t exist')
    }
    return [existingUser, existingStats];
  }

  async stats(user: User) {
    const existingStats = await this.meRepository.findOne({
      where: {
        user: {id: user.id},
      }
    })
    if(!existingStats){
      throw new NotFoundException('This stats dosen\'t exist')
    }
    return existingStats;
  }

  async update(userid: string, updateMeDto: UpdateMeDto) {
    const existingStats = await this.meRepository.findOne({
      where: {
        user: {id: userid}
      }
    });

    if (!existingStats) {
      throw new NotFoundException("Stats not found");
    }
    existingStats.filmsvu += updateMeDto.filmsvu || 0;
    existingStats.tempsvu += updateMeDto.tempsvu || 0;
    existingStats.livreslu += updateMeDto.livreslu || 0;
    existingStats.pageslu += updateMeDto.pageslu || 0;

    const savedStats = await this.meRepository.save(existingStats);
    return savedStats;
}


  async remove(id: string) {
    const stats = await this.meRepository.findOne({
      where: {user:{id}}
    })
    if(!stats){
      throw new NotFoundException("This stats dosen't exist");
    }
    this.meRepository.delete(stats.id);
    return `This action removes a #${id} stats`;
  }
}
