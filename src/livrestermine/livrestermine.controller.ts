import { Controller, Get, Post, Body, Param, Delete } from '@nestjs/common';
import { LivrestermineService } from './livrestermine.service';
import { CreateLivrestermineDto } from './dto/create-livrestermine.dto';

@Controller('user/me/livrestermine')
export class LivrestermineController {
  constructor(private readonly livrestermineService: LivrestermineService) {}

  @Post()
  create(@Body() createLivrestermineDto: CreateLivrestermineDto) {
    return this.livrestermineService.create(createLivrestermineDto);
  }

  @Get(':id')
  findAll(@Param('id') id: string) {
    return this.livrestermineService.findAll(id);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.livrestermineService.remove(id);
  }
}
