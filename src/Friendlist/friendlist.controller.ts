import { Controller, Post, Body, Get, Delete } from "@nestjs/common";
import { Friendlist, userfriendDto, userprincipalDto } from "./friendlist.entity";
import { FriendlistService } from "./friendlist.service";

@Controller("/friendlist")
export class FriendlistController {
    constructor(private readonly friendlistService: FriendlistService) {}
    @Post('addfriend')
    async addfriend(@Body() friend: Friendlist): Promise<Friendlist> {
      return await this.friendlistService.addfriend(friend);
    }
    @Post('listmyfriend')
    async listfriend(@Body()  userprincipal: userprincipalDto): Promise<Friendlist[]> {
      return await this.friendlistService.listfriend(userprincipal);
    }

    @Post('listmyfriend/searchfriend')
    async searchfriend(@Body() userfriend: userfriendDto): Promise<Friendlist> {
      return await this.friendlistService.searchfriend(userfriend);
    }

    @Delete('listmyfriend/deletefriend')
    async deletefriend(@Body() userfriend: userfriendDto): Promise<void> {
      return await this.friendlistService.deletefriend(userfriend);
    }
}