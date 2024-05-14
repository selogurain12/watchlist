import { Module } from '@nestjs/common';
import { FilmstermineService } from './filmstermine.service';
import { FilmstermineController } from './filmstermine.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Filmstermine } from './entities/filmstermine.entity';
import { MovieService } from '../movie/movie.service';

@Module({
  imports: [TypeOrmModule.forFeature([Filmstermine])],
  controllers: [FilmstermineController],
  providers: [FilmstermineService, MovieService],
})
export class FilmstermineModule {}
