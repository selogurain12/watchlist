import { Module } from '@nestjs/common';
import { FriendslistService } from './friendslist.service';
import { FriendslistController } from './friendslist.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Friendslist } from './entities/friendslist.entity';
import { User } from '../users/entities/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Friendslist, User])],
  controllers: [FriendslistController],
  providers: [FriendslistService],
})
export class FriendslistModule {}
