import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FilmstermineService } from './filmstermine.service';
import { CreateFilmstermineDto } from './dto/create-filmstermine.dto';
import { UpdateFilmstermineDto } from './dto/update-filmstermine.dto';
import { User } from '../users/entities/user.entity';

@Controller('user/me/filmstermine')
export class FilmstermineController {
  constructor(private readonly filmstermineService: FilmstermineService) {}

  @Post()
  create(@Body() createFilmstermineDto: CreateFilmstermineDto) {
    return this.filmstermineService.create(createFilmstermineDto);
  }

  @Get()
  findAll(@Body() user: User) {
    return this.filmstermineService.findAll(user);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.filmstermineService.remove(id);
  }
}
