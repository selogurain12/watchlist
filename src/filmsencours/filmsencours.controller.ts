import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FilmsencoursService } from './filmsencours.service';
import { CreateFilmsencoursDto } from './dto/create-filmsencours.dto';
import { UpdateFilmsencoursDto } from './dto/update-filmsencours.dto';

@Controller('user/me/filmsencours')
export class FilmsencoursController {
  constructor(private readonly filmsencoursService: FilmsencoursService) {}

  @Post()
  create(@Body() createFilmsencourDto: CreateFilmsencoursDto) {
    return this.filmsencoursService.create(createFilmsencourDto);
  }

  @Get()
  findAll() {
    return this.filmsencoursService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.filmsencoursService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateFilmsencourDto: UpdateFilmsencoursDto) {
    return this.filmsencoursService.update(id, updateFilmsencourDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.filmsencoursService.remove(id);
  }
}
