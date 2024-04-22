import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateFilmstermineDto } from './dto/create-filmstermine.dto';
import { UpdateFilmstermineDto } from './dto/update-filmstermine.dto';
import { Filmstermine } from './entities/filmstermine.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class FilmstermineService {
  constructor(
    @InjectRepository(Filmstermine)
    public readonly filmstermineRepository: Repository<Filmstermine>,
  ){}
  async create(createFilmstermineDto: CreateFilmstermineDto) {
    const existingFilmtermine = await this.filmstermineRepository.findOne({
      where: {
        id_film: createFilmstermineDto.id_film,
        user: {
          id: createFilmstermineDto.user.id
        }
      }
    })
    if(existingFilmtermine){
      throw new ConflictException("This movie is already added")
    }
    const saveFilmstermie = this.filmstermineRepository.create({
      user: createFilmstermineDto.user,
      id_film: createFilmstermineDto.id_film
    })
    return this.filmstermineRepository.save(saveFilmstermie);
  }

  findAll() {
    return this.filmstermineRepository.find();
  }

  async remove(id: string) {
    const existingFilmtermine = await this.filmstermineRepository.findOne({
      where: {id}
    })
    if(!existingFilmtermine){
      throw new NotFoundException("This relation dosen't exist")
    }
    return this.filmstermineRepository.delete(existingFilmtermine.id);
  }
}
