import { ConflictException, Injectable, NotFoundException } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { In, QueryFailedError, Repository } from "typeorm";
import { FilmFilmotheque, Filmotheque, filmoDto, searchfilmoDto } from "./usermovie.entity";
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

    async listfilmotheque(id: searchfilmoDto): Promise<Filmotheque[]> {
    return await this.filmothequeRepository.find({where: {
            id_user: id.id
    }})
    }

    async addmovie(movie: FilmFilmotheque): Promise<FilmFilmotheque> {
        const newmovie =  this.filmfilmothequeRepository.create(movie);
        return await this.filmfilmothequeRepository.save(newmovie);
    }

    // Assuming 'id' is of type 'number' in both FilmFilmotheque and Movie entities

    async listmovie(filmotheque: filmoDto): Promise<Movie[]> {
      console.log(filmotheque.id_filmotheque);
      const films = await this.filmfilmothequeRepository.find({ where: { id_filmotheque: filmotheque.id_filmotheque } });
      console.log(films)
      const movieIds = films.map((film) => film.id_film);
      // Use Promise.all to concurrently fetch all movies
      const movies = await Promise.all(movieIds.map(id => this.movieService.getMovie(id)));
      return movies;
    }

    async renamefilmotheque(filmotheque: Filmotheque): Promise<Filmotheque> {
      const existingFilmotheque = await this.filmothequeRepository.findOne({ where: { id: filmotheque.id, id_user: filmotheque.id_user } });
      if (!existingFilmotheque) {
        throw new Error('Filmotheque not found');
      }
      existingFilmotheque.nom = filmotheque.nom;
      const newFilmotheque = await this.filmothequeRepository.save(existingFilmotheque);
      return newFilmotheque;
    }
    
    async deletefilmotheque(idfilmotheque: filmoDto): Promise<void> {
      const filmotheque = await this.filmothequeRepository.findOne({
        where: {
          id: idfilmotheque.id_filmotheque,
        },
      });

      const movies = await this.filmfilmothequeRepository.find({
        where:{
          id_filmotheque: idfilmotheque.id_filmotheque,
        }
      })
    
      if (!filmotheque) {
        throw new NotFoundException('Filmotheque relation not found.');
      }
    
      const result = await this.filmothequeRepository.delete(filmotheque.id); 

      movies.map((movie) => this.filmfilmothequeRepository.delete(movie.id))
    
      if (result.affected === 0) {
        throw new NotFoundException('Failed to delete the filmotheque relation.');
      }
    }

    async deletemovie(filmothequemovie: FilmFilmotheque): Promise<void> {
      const movie = await this.filmfilmothequeRepository.findOne({
        where: {
          id: filmothequemovie.id,
        },
      });
    
      if (!movie) {
        throw new NotFoundException('Movie relation not found.');
      }
    
      const result = await this.filmfilmothequeRepository.delete(movie.id); 

      if (result.affected === 0) {
        throw new NotFoundException('Failed to delete the movie relation.');
      }
    }
  }