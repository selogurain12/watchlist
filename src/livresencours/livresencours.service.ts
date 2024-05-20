import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateLivresencoursDto } from './dto/create-livresencours.dto';
import { UpdateLivresencoursDto } from './dto/update-livresencours.dto';
import { Livresencours } from './entities/livresencours.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { BookService } from '../Book/book.service';
import { User } from '../users/entities/user.entity';

@Injectable()
export class LivresencoursService {
  constructor(
    @InjectRepository(Livresencours)
    public readonly livresencoursRepository: Repository<Livresencours>,
    private readonly livreService: BookService,
  ){}

  async create(createLivresencoursDto: CreateLivresencoursDto) {
    const existingLivreenCours = await this.livresencoursRepository.findOne({
      where: {
        id_livre: createLivresencoursDto.id_livre,
        user: {
          id: createLivresencoursDto.user.id
        },
      }
    });
    if (existingLivreenCours) {
      throw new ConflictException("This book is already added");
    }
    const saveLivreencours = this.livresencoursRepository.create(createLivresencoursDto);

    const saved = await this.livresencoursRepository.save(saveLivreencours);
    // Créer un objet sans inclure les détails de l'utilisateur
    const result = {
      id: saved.id,
      id_livre: saved.id_livre,
      nbpageslus: saved.nbpageslus
    };

    return result;
  }

  async findAll(id: string) {
    const livres = await this.livresencoursRepository.find({
      where: {
        user: {
          id
        }
      }
    });
    const booksWithPagesLues = await Promise.all(
      livres.map(async (livre) => {
        const bookDetails = await this.livreService.getBook(livre.id_livre);
        return {
          ...bookDetails,
          nbpageslus: livre.nbpageslus
        };
      })
    );
    return booksWithPagesLues;
  }
  

  async findlivre(id: string) {
    return await this.livresencoursRepository.findOne({
      where: {
        id_livre: id
      }
    });
  }

  countAll(users: User) {
    return this.livresencoursRepository.count({where: 
      {user: {
        id: users.id
      }},
      relations: ["user"]
    });
  }

  async update(id: string, updateLivresencoursDto: UpdateLivresencoursDto) {
    const existingLivreenCours = await this.livresencoursRepository.findOne({
      where: {id_livre: id}
    })
    if(!existingLivreenCours){
      throw new NotFoundException("This relation dosen't exist")
    }
    existingLivreenCours.nbpageslus = updateLivresencoursDto.nbpageslus;
    await this.livresencoursRepository.save(existingLivreenCours)
    return existingLivreenCours;
  }

  async remove(id: string) {
    const existingLivreenCours = await this.livresencoursRepository.findOne({
      where: {id_livre: id}
    })
    if(!existingLivreenCours){
      throw new NotFoundException("This relation dosen't exist")
    }
    this.livresencoursRepository.delete(existingLivreenCours.id)
  }
}
