import { Module } from '@nestjs/common';
import { UserService } from './users.service';
import { UserController } from './users.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { MeService } from '../me/me.service';
import { Stats } from '../me/entities/me.entity';
import { FriendslistService } from '../friendslist/friendslist.service';
import { Friendslist } from '../friendslist/entities/friendslist.entity';

@Module({
  imports: [TypeOrmModule.forFeature([User, Stats, Friendslist])],
  controllers: [UserController],
  providers: [UserService, MeService, FriendslistService],
})
export class UserModule {}
