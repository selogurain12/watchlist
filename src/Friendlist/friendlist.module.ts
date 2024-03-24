import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { Friendlist } from "./friendlist.entity";
import { FriendlistController } from "./friendlist.controller";
import { FriendlistService } from "./friendlist.service";
import { UserService } from "../user/user.service";
import { Statuser, User } from "../user/user.entity";

@Module({
    imports: [TypeOrmModule.forFeature([Friendlist, User, Statuser])],
    controllers: [FriendlistController],
    providers: [FriendlistService, UserService],
})
export class FriendlistModule {}