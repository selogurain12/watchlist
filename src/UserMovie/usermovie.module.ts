import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { FilmFilmotheque, Filmotheque } from './usermovie.entity';
import { UserMovieController } from './usermovie.controller';
import { UserMovieService } from './usermovie.service';
import { Movie } from '../Movie/movie.entity';
import { MovieService } from '../Movie/movie.service';

@Module({
  imports: [TypeOrmModule.forFeature([Filmotheque, FilmFilmotheque, Movie])],
  controllers: [UserMovieController],
  providers: [UserMovieService, MovieService],
})
export class UserMovieModule {}