import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { LivrestermineService } from './livrestermine.service';
import { CreateLivrestermineDto } from './dto/create-livrestermine.dto';
import { UpdateLivrestermineDto } from './dto/update-livrestermine.dto';
import { User } from '../users/entities/user.entity';

@Controller('user/me/livrestermine')
export class LivrestermineController {
  constructor(private readonly livrestermineService: LivrestermineService) {}

  @Post()
  create(@Body() createLivrestermineDto: CreateLivrestermineDto) {
    return this.livrestermineService.create(createLivrestermineDto);
  }

  @Get()
  findAll(@Body() user: User) {
    return this.livrestermineService.findAll(user);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.livrestermineService.remove(id);
  }
}
