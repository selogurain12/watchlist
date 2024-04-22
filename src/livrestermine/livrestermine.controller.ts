import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { LivrestermineService } from './livrestermine.service';
import { CreateLivrestermineDto } from './dto/create-livrestermine.dto';
import { UpdateLivrestermineDto } from './dto/update-livrestermine.dto';

@Controller('livrestermine')
export class LivrestermineController {
  constructor(private readonly livrestermineService: LivrestermineService) {}

  @Post()
  create(@Body() createLivrestermineDto: CreateLivrestermineDto) {
    return this.livrestermineService.create(createLivrestermineDto);
  }

  @Get()
  findAll() {
    return this.livrestermineService.findAll();
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.livrestermineService.remove(id);
  }
}
