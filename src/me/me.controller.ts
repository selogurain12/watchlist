import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { MeService } from './me.service';
import { CreateMeDto } from './dto/create-me.dto';
import { UpdateMeDto } from './dto/update-me.dto';
import { User } from '../user/user.entity';

@Controller('user/me')
export class MeController {
  constructor(private readonly meService: MeService) {}


  @Get("infos")
  me(@Body() user: User) {
    return this.meService.me(user);
  }

  @Get("stats")
  stats(@Body() user: User) {
    return this.meService.stats(user);
  }


  @Patch(':id')
  update(@Param('id') id: string, @Body() updateMeDto: UpdateMeDto) {
    return this.meService.update(id, updateMeDto);
  }

}
