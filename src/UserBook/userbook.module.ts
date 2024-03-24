import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Bibliotheque, LivreBibliotheque } from './userbook.entity';
import { Book } from '../Book/book.entity';
import { UserBookController } from './userbook.controller';
import { UserBookService } from './userbook.service';
import { BookService } from '../Book/book.service';

@Module({
  imports: [TypeOrmModule.forFeature([Bibliotheque, LivreBibliotheque, Book])],
  controllers: [UserBookController],
  providers: [UserBookService, BookService],
})
export class UserBookModule {}