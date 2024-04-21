import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { BibliothequeService } from './bibliotheque.service';
import { CreateBibliothequeDto } from './dto/create-bibliotheque.dto';
import { UpdateBibliothequeDto } from './dto/update-bibliotheque.dto';
import { User } from '../users/entities/user.entity';

@Controller('user/me/bibliotheque')
export class BibliothequeController {
  constructor(private readonly bibliothequeService: BibliothequeService) {}

  @Post()
  create(@Body() createBibliothequeDto: CreateBibliothequeDto) {
    return this.bibliothequeService.create(createBibliothequeDto);
  }

  @Get()
  findAll(@Body() user: User) {
    return this.bibliothequeService.findAll(user);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateBibliothequeDto: UpdateBibliothequeDto) {
    return this.bibliothequeService.update(id, updateBibliothequeDto);
  }

  @Delete('user/:id')
  removeUserBibliotheque(@Param('id') id: string, @Body() user: User) {
    return this.bibliothequeService.removeUserBibliotheque(id, user);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.bibliothequeService.remove(id);
  }
}
