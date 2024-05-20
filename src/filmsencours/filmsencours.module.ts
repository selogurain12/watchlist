import { Module } from '@nestjs/common';
import { FilmsencoursService } from './filmsencours.service';
import { FilmsencoursController } from './filmsencours.controller';
import { Filmsencours } from './entities/filmsencours.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MovieService } from '../movie/movie.service';

@Module({
  imports: [TypeOrmModule.forFeature([Filmsencours])],
  controllers: [FilmsencoursController],
  providers: [FilmsencoursService, MovieService],
  exports: [FilmsencoursService]
})
export class FilmsencoursModule {}
