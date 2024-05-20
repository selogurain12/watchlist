import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateFilmstermineDto } from './dto/create-filmstermine.dto';
import { Filmstermine } from './entities/filmstermine.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { MovieService } from '../movie/movie.service';
import { User } from '../users/entities/user.entity';

@Injectable()
export class FilmstermineService {
  constructor(
    @InjectRepository(Filmstermine)
    public readonly filmstermineRepository: Repository<Filmstermine>,
    private readonly movieService: MovieService,
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

  async findAll(id: string) {
    const films = await this.filmstermineRepository.find({
      where: {
        user: {
          id
        }
      },
      relations: ["user"]
    });
    const movieIds = films.map(film => film.id_film);
    const movies = await Promise.all(movieIds.map(id => this.movieService.getMovie(id)));
    return movies;
  }

  countAll(users: User) {
    return this.filmstermineRepository.count({where: 
      {user: {
        id: users.id
      }},
      relations: ["user"]
    });
  }
  

  async remove(id: string) {
    const existingFilmtermine = await this.filmstermineRepository.findOne({
      where: {id_film: id}
    })
    if(!existingFilmtermine){
      throw new NotFoundException("This relation dosen't exist")
    }
    this.filmstermineRepository.delete(existingFilmtermine.id);
  }
}
