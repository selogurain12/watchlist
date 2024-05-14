import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateLivrestermineDto } from './dto/create-livrestermine.dto';
import { Livrestermine } from './entities/livrestermine.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BookService } from '../Book/book.service';

@Injectable()
export class LivrestermineService {
  constructor(
    @InjectRepository(Livrestermine)
    public readonly livretermineRepository: Repository<Livrestermine>,
    private readonly livreService: BookService,
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

  async findAll(id: string) {
    const livres = await this.livretermineRepository.find({
      where: {
        user: {
          id
        }
      }
    });
    const livreIds = livres.map(livre => livre.id_livre);
    const books = await Promise.all(livreIds.map(id => this.livreService.getBook(id)));
    return books
  }

  async remove(id: string) {
    const existingLivretermine = await this.livretermineRepository.findOne({
      where: {id_livre: id}
    })
    if(!existingLivretermine){
      throw new NotFoundException("This relation dosen't exist")
    }
    this.livretermineRepository.delete(existingLivretermine.id);
  }
}
