import { Module } from '@nestjs/common';
import { BibliothequeService } from './bibliotheque.service';
import { BibliothequeController } from './bibliotheque.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Bibliotheque } from './entities/bibliotheque.entity';
import { User } from '../users/entities/user.entity';
import { BookService } from '../Book/book.service';

@Module({
  imports: [TypeOrmModule.forFeature([User, Bibliotheque])],
  controllers: [BibliothequeController],
  providers: [BibliothequeService, BookService],
})
export class BibliothequeModule {}
