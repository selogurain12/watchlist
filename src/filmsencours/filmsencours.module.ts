import { Module } from '@nestjs/common';
import { FilmsencoursService } from './filmsencours.service';
import { FilmsencoursController } from './filmsencours.controller';
import { Filmsencours } from './entities/filmsencours.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Filmsencours])],
  controllers: [FilmsencoursController],
  providers: [FilmsencoursService],
})
export class FilmsencoursModule {}
