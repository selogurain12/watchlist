import { Controller, Get, Post, Body, Param, Delete } from '@nestjs/common';
import { FilmstermineService } from './filmstermine.service';
import { CreateFilmstermineDto } from './dto/create-filmstermine.dto';

@Controller('user/me/filmstermine')
export class FilmstermineController {
  constructor(private readonly filmstermineService: FilmstermineService) {}

  @Post()
  create(@Body() createFilmstermineDto: CreateFilmstermineDto) {
    return this.filmstermineService.create(createFilmstermineDto);
  }

  @Get(':id')
  findAll(@Param('id') id: string) {
    return this.filmstermineService.findAll(id);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.filmstermineService.remove(id);
  }
}
