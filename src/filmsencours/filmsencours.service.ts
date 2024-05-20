import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateFilmsencoursDto } from './dto/create-filmsencours.dto';
import { UpdateFilmsencoursDto } from './dto/update-filmsencours.dto';
import { Filmsencours } from './entities/filmsencours.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { MovieService } from '../movie/movie.service';
import { User } from '../users/entities/user.entity';

@Injectable()
export class FilmsencoursService {
  constructor(
    @InjectRepository(Filmsencours)
    public readonly filmsencoursRepository: Repository<Filmsencours>,
    private readonly movieService: MovieService,
  ){}
  
  async create(createFilmsencoursDto: CreateFilmsencoursDto) {
    const existingFilmenCours = await this.filmsencoursRepository.findOne({
      where: {
        id_film: createFilmsencoursDto.id_film,
        user: {
          id: createFilmsencoursDto.user.id
        },
      }
    })
    if(existingFilmenCours){
      throw new ConflictException("This movie is already added")
    }
    const saveFilmsencours = this.filmsencoursRepository.create({
      tempsvisionnage: createFilmsencoursDto.tempsvisionnage,
      user: createFilmsencoursDto.user,
      id_film: createFilmsencoursDto.id_film
    })
    return this.filmsencoursRepository.save(saveFilmsencours);
  }

  async findAll(id: string) {
    const films = await this.filmsencoursRepository.find({
      where: {
        user: {
          id
        }
      }
    });
    const movieWithTempsVus = await Promise.all(
      films.map(async (film) => {
        const movieDetails = await this.movieService.getMovie(film.id_film);
        return {
          ...movieDetails,
          tempsvisionnage: film.tempsvisionnage
        };
      })
    );
    return movieWithTempsVus;
  }

  countAll(users: User) {
    return this.filmsencoursRepository.count({where: 
      {user: {
        id: users.id
      }},
      relations: ["user"]
    });
  }

  async findfilm(id: string) {
    return await this.filmsencoursRepository.find({
      where: {
        id_film: id
      }
    });
  }

  async update(id: string, updateFilmsencoursDto: UpdateFilmsencoursDto) {
    const existingFilmenCours = await this.filmsencoursRepository.findOne({
      where: {id_film: id}
    })
    if(!existingFilmenCours){
      throw new NotFoundException("This relation dosen't exist")
    }
    existingFilmenCours.tempsvisionnage = updateFilmsencoursDto.tempsvisionnage;
    await this.filmsencoursRepository.save(existingFilmenCours)
    return existingFilmenCours;
  }

  async remove(id: string) {
    const existingFilmenCours = await this.filmsencoursRepository.findOne({
      where: {id_film: id}
    })
    if(!existingFilmenCours){
      throw new NotFoundException("This relation dosen't exist")
    }
    this.filmsencoursRepository.delete(existingFilmenCours.id)
  }
}
