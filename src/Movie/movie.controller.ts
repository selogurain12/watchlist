// data.controller.ts
import { Body, Controller, Post } from '@nestjs/common';
import { MovieService } from './movie.service';

@Controller('movie')
export class MovieController {
  constructor(private readonly movieService: MovieService) {}

  @Post()
  async searchmovie(@Body('query') query: string) {
    console.log(query)
      return this.movieService.searchmovie(query);
  }
}
