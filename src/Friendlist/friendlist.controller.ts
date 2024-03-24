import { Controller, Post, Body, Get } from "@nestjs/common";
import { Friendlist, userfriendDto, userprincipalDto } from "./friendlist.entity";
import { FriendlistService } from "./friendlist.service";

@Controller("/friendlist")
export class FriendlistController {
    constructor(private readonly friendlistService: FriendlistService) {}
    @Post('')
    async addfriend(@Body() friend: Friendlist): Promise<Friendlist> {
      return await this.friendlistService.addfriend(friend);
    }
    @Post('userprincipal')
    async listfriend(@Body()  userprincipal: userprincipalDto): Promise<Friendlist[]> {
      return await this.friendlistService.listfriend(userprincipal);
    }

    @Post('userprincipal/user')
    async searchfriend(@Body() userfriend: userfriendDto): Promise<Friendlist> {
      return await this.friendlistService.searchfriend(userfriend);
    }
}