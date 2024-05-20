import { Module } from '@nestjs/common';
import { MeService } from './me.service';
import { MeController } from './me.controller';
import { Stats } from './entities/me.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '../users/entities/user.entity';
import { Filmotheque } from '../filmotheque/entities/filmotheque.entity';
import { MovieModule } from '../movie/movie.module';
import { FilmothequeModule } from '../filmotheque/filmotheque.module';
import { BibliothequeModule } from '../bibliotheque/bibliotheque.module';
import { FilmstermineModule } from '../filmstermine/filmstermine.module';
import { FilmsencoursModule } from '../filmsencours/filmsencours.module';
import { LivrestermineModule } from '../livrestermine/livrestermine.module';
import { LivresencoursModule } from '../livresencours/livresencours.module';

@Module({
  imports: [TypeOrmModule.forFeature([Stats, User, Filmotheque]), 
  MovieModule, 
  FilmothequeModule, 
  BibliothequeModule,
  FilmstermineModule,
  FilmsencoursModule,
  LivrestermineModule,
  LivresencoursModule
],
  controllers: [MeController],
  providers: [MeService],
})
export class MeModule {}
