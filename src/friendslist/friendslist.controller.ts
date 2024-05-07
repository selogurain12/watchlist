import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FriendslistService } from './friendslist.service';
import { CreateFriendslistDto } from './dto/create-friendslist.dto';
import { UpdateFriendslistDto } from './dto/update-friendslist.dto';
import { User } from '../users/entities/user.entity';

@Controller('user/me/friendslist')
export class FriendslistController {
  constructor(private readonly friendslistService: FriendslistService) {}

  @Get()
  findAll(@Body() user: User) {
    return this.friendslistService.findAll(user);
  }


  @Patch(':id')
  update(@Param('id') id: string, @Body() updateFriendslistDto: UpdateFriendslistDto) {
    return this.friendslistService.update(id, updateFriendslistDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.friendslistService.removefriend(id);
  }
}
