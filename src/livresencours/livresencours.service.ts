import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateLivresencoursDto } from './dto/create-livresencours.dto';
import { UpdateLivresencoursDto } from './dto/update-livresencours.dto';
import { Livresencours } from './entities/livresencours.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class LivresencoursService {
  constructor(
    @InjectRepository(Livresencours)
    public readonly livresencoursRepository: Repository<Livresencours>,
  ){}

  async create(createLivresencoursDto: CreateLivresencoursDto) {
    const existingLivreenCours = await this.livresencoursRepository.findOne({
      where: {
        id_livre: createLivresencoursDto.id_livre,
        user: {
          id: createLivresencoursDto.user.id
        },
      }
    })
    if(existingLivreenCours){
      throw new ConflictException("This book is already added")
    }
    const saveLivreencours = this.livresencoursRepository.create({
      nbpageslus: createLivresencoursDto.nbpageslus,
      user: createLivresencoursDto.user,
      id_livre: createLivresencoursDto.id_livre
    })
    return this.livresencoursRepository.save(saveLivreencours);
  }

  findAll() {
    return this.livresencoursRepository.find();
  }

  async findOne(id: string) {
    const existingLivreenCours = await this.livresencoursRepository.findOne({
      where: {id}
    })
    if(!existingLivreenCours){
      throw new NotFoundException("This relation dosen't exist")
    }
    return existingLivreenCours;
  }

  async update(id: string, updateLivresencoursDto: UpdateLivresencoursDto) {
    const existingLivreenCours = await this.livresencoursRepository.findOne({
      where: {id}
    })
    if(!existingLivreenCours){
      throw new NotFoundException("This relation dosen't exist")
    }
    existingLivreenCours.nbpageslus = existingLivreenCours.nbpageslus;
    await this.livresencoursRepository.save(existingLivreenCours)
    return existingLivreenCours;
  }

  async remove(id: string) {
    const existingLivreenCours = await this.livresencoursRepository.findOne({
      where: {id}
    })
    if(!existingLivreenCours){
      throw new NotFoundException("This relation dosen't exist")
    }
    this.livresencoursRepository.delete(existingLivreenCours.id)
  }
}
