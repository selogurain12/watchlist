import { Controller, Post, Body, Get } from "@nestjs/common";
import { LoginDto, MeDto, Statuser, User, Username } from "./user.entity";
import { UserService } from "./user.service";

@Controller("/user")
export class UserController {
    constructor(private readonly userService: UserService) {}
    @Post('auth/sign-up')
    async signUp(@Body() user: User): Promise<[User, Statuser]> {
      return await this.userService.register(user);
    }
    @Post('auth/login')
    async login(@Body()  login: LoginDto): Promise<User> {
      return await this.userService.login(login);
    }

    @Post('me')
    async me(@Body() user: MeDto): Promise<[User, Statuser]> {
      return await this.userService.me(user);
    }

    @Post('search')
    async searchuser(@Body() username: Username): Promise<User> {
      return await this.userService.searchuser(username);
    }

    @Post('me/stats')
    async statsuser(@Body() user: MeDto): Promise<Statuser> {
      return await this.userService.statsuser(user);
    }

    @Post('me/updatestats')
    async updatestats(@Body() stats: Statuser): Promise<Statuser> {
      return await this.userService.updatestat(stats);
    }
}