import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateFilmsencoursDto } from './dto/create-filmsencours.dto';
import { UpdateFilmsencoursDto } from './dto/update-filmsencours.dto';
import { Filmsencours } from './entities/filmsencours.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { MovieService } from '../movie/movie.service';

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
    const movieIds = films.map(film => film.id_film);
    const movies = await Promise.all(movieIds.map(id => this.movieService.getMovie(id)));
    return movies;
  }

  async findOne(id: string) {
    const existingFilmenCours = await this.filmsencoursRepository.findOne({
      where: {id}
    })
    if(!existingFilmenCours){
      throw new NotFoundException("This relation dosen't exist")
    }
    return existingFilmenCours;
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
