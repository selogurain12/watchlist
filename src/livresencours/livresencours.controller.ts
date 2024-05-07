import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { LivresencoursService } from './livresencours.service';
import { CreateLivresencoursDto } from './dto/create-livresencours.dto';
import { UpdateLivresencoursDto } from './dto/update-livresencours.dto';
import { User } from '../users/entities/user.entity';
import { UserController } from '../users/users.controller';

@Controller('user/me/livresencours')
export class LivresencoursController {
  constructor(private readonly livresencoursService: LivresencoursService) {}

  @Post()
  create(@Body() createLivresencoursDto: CreateLivresencoursDto) {
    return this.livresencoursService.create(createLivresencoursDto);
  }

  @Get()
  findAll(@Body() user: User) {
    return this.livresencoursService.findAll(user);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.livresencoursService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateLivresencoursDto: UpdateLivresencoursDto) {
    return this.livresencoursService.update(id, updateLivresencoursDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.livresencoursService.remove(id);
  }
}
