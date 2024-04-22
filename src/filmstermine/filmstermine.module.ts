import { Module } from '@nestjs/common';
import { FilmstermineService } from './filmstermine.service';
import { FilmstermineController } from './filmstermine.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Filmstermine } from './entities/filmstermine.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Filmstermine])],
  controllers: [FilmstermineController],
  providers: [FilmstermineService],
})
export class FilmstermineModule {}
