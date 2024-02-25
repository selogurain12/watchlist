// data.controller.ts
import { Body, Controller, Post } from '@nestjs/common';
import { BookService } from './book.service';
import { Book } from './book.entity';

@Controller('book')
export class BookController {
  constructor(private readonly bookService: BookService) {}

  @Post()
  async searchbook(@Body('q') q: string):Promise<Book[]> {
      return this.bookService.searchbook(q);
  }
}
