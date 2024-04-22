import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FilmstermineService } from './filmstermine.service';
import { CreateFilmstermineDto } from './dto/create-filmstermine.dto';
import { UpdateFilmstermineDto } from './dto/update-filmstermine.dto';

@Controller('filmstermine')
export class FilmstermineController {
  constructor(private readonly filmstermineService: FilmstermineService) {}

  @Post()
  create(@Body() createFilmstermineDto: CreateFilmstermineDto) {
    return this.filmstermineService.create(createFilmstermineDto);
  }

  @Get()
  findAll() {
    return this.filmstermineService.findAll();
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.filmstermineService.remove(id);
  }
}
