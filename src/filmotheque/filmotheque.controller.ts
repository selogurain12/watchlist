import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FilmothequeService } from './filmotheque.service';
import { CreateFilmothequeDto } from './dto/create-filmotheque.dto';
import { UpdateFilmothequeDto } from './dto/update-filmotheque.dto';
import { User } from '../users/entities/user.entity';

@Controller('user/me/filmotheque')
export class FilmothequeController {
  constructor(private readonly filmothequeService: FilmothequeService) {}

  @Post()
  create(@Body() createFilmothequeDto: CreateFilmothequeDto) {
    return this.filmothequeService.create(createFilmothequeDto);
  }

  @Get()
  findAll(@Body() user: User) {
    return this.filmothequeService.findAll(user);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateFilmothequeDto: UpdateFilmothequeDto) {
    return this.filmothequeService.update(id, updateFilmothequeDto);
  }

  @Delete('user/:id')
  removeUserFilmotheque(@Param('id') id: string, @Body() user: User) {
    return this.filmothequeService.removeUserFilmotheque(id, user);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.filmothequeService.remove(id);
  }
}
