//login-user.dto.ts
import { IsNotEmpty } from 'class-validator';
export class LoginUserDto {
  @IsNotEmpty()
  username!: string;

  @IsNotEmpty()
  mdp!: string;
}