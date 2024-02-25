import { Controller, Post, Body, Get } from "@nestjs/common";
import { LoginDto, User } from "./user.entity";
import { UserService } from "./user.service";

@Controller("/user")
export class UserController {
    constructor(private readonly userService: UserService) {}
    @Post('auth/sign-up')
    async signUp(@Body() user: User): Promise<User> {
      const createdUser = await this.userService.register(user);
      return {
        id: createdUser.id,
        nom: createdUser.nom,
        prenom: createdUser.prenom,
        mail: createdUser.mail,
        mdp: createdUser.mdp,
      };
    }
    @Post('auth/login')
    async login(@Body()  login: LoginDto): Promise<User> {
      const utilisateur = await this.userService.login(login);
      return utilisateur;
    }
  
    @Get()
    async getUsers(): Promise<User[]>{
       return this.userService.findAll();
    }
}