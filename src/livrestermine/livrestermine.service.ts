import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateLivrestermineDto } from './dto/create-livrestermine.dto';
import { UpdateLivrestermineDto } from './dto/update-livrestermine.dto';
import { Livrestermine } from './entities/livrestermine.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class LivrestermineService {
  constructor(
    @InjectRepository(Livrestermine)
    public readonly livretermineRepository: Repository<Livrestermine>,
  ){}
  async create(createLivrestermineDto: CreateLivrestermineDto) {
    const existingLivretermine = await this.livretermineRepository.findOne({
      where: {
        id_livre: createLivrestermineDto.id_livre,
        user: {
          id: createLivrestermineDto.user.id
        }
      }
    })
    if(existingLivretermine){
      throw new ConflictException("This book is already added")
    }
    const saveLivretermie = this.livretermineRepository.create({
      user: createLivrestermineDto.user,
      id_livre: createLivrestermineDto.id_livre
    })
    return this.livretermineRepository.save(saveLivretermie);
  }

  findAll() {
    return this.livretermineRepository.find();
  }

  async remove(id: string) {
    const existingLivretermine = await this.livretermineRepository.findOne({
      where: {id}
    })
    if(!existingLivretermine){
      throw new NotFoundException("This relation dosen't exist")
    }
    return this.livretermineRepository.delete(existingLivretermine.id);
  }
}
