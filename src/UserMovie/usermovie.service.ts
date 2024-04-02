import { ConflictException, Injectable, NotFoundException } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { In, QueryFailedError, Repository } from "typeorm";
import { FilmFilmotheque, Filmotheque, searchfilmoDto } from "./usermovie.entity";
import { Movie } from "../Movie/movie.entity";
import { MovieService } from "../Movie/movie.service";

@Injectable()
export class UserMovieService {
  constructor(
    @InjectRepository(Filmotheque)
    private readonly filmothequeRepository: Repository<Filmotheque>,
    @InjectRepository(FilmFilmotheque)
    private readonly filmfilmothequeRepository: Repository<FilmFilmotheque>,
    private readonly movieService: MovieService,
  ) {}
    async createfilmotheque(filmo: Filmotheque): Promise<Filmotheque> {
        const newFilmotheque = this.filmothequeRepository.create(filmo);
      const filmotheque = await this.filmothequeRepository.save(newFilmotheque);
      return filmotheque;
    }

    async filmotheque(id: searchfilmoDto): Promise<Filmotheque[]> {
    return await this.filmothequeRepository.find({where: {
            id_user: id.id
    }})
    }

    async addmovie(movie: FilmFilmotheque): Promise<FilmFilmotheque> {
        const newmovie =  this.filmfilmothequeRepository.create(movie);
        return await this.filmfilmothequeRepository.save(newmovie);
    }

    // Assuming 'id' is of type 'number' in both FilmFilmotheque and Movie entities

    async listmovie(filmotheque: searchfilmoDto): Promise<Movie[]> {
      const films = await this.filmfilmothequeRepository.find({ where: { id_filmotheque: filmotheque.id } });
    
      if (!films || films.length === 0) {
        throw new NotFoundException('No films found for the given filmotheque ID');
      }
    
      const movieIds = films.map((film) => film.id_film);
      // Use Promise.all to concurrently fetch all movies
      const movies = await Promise.all(movieIds.map(id => this.movieService.getMovie(id)));
      console.log(movies)
      return movies;
    }
    
  }