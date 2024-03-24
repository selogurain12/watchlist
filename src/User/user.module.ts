import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserController } from './user.controller';
import { UserService } from './user.service';
import { Statuser, User } from './user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([User, Statuser])],
  controllers: [UserController],
  providers: [UserService],
})
export class UserModule {}