import { Module } from '@nestjs/common';
import { FilmothequeService } from './filmotheque.service';
import { FilmothequeController } from './filmotheque.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '../users/entities/user.entity';
import { Filmotheque } from './entities/filmotheque.entity';
import { MovieService } from '../Movie/movie.service';
import { Movie } from '../Movie/movie.entity';

@Module({
  imports: [TypeOrmModule.forFeature([User, Filmotheque])],
  controllers: [FilmothequeController],
  providers: [FilmothequeService, MovieService],
  exports:[FilmothequeService]
})
export class FilmothequeModule {}
