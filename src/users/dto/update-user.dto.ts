// update-user.dto.ts
import { IsString, IsOptional, IsEnum, IsEmail } from 'class-validator';

export class UpdateUserDto {
  @IsOptional()
  @IsString()
  username?: string;

  @IsOptional()
  @IsString()
  nom?: string;

  @IsOptional()
  @IsString()
  prenom?: string;

  @IsOptional()
  @IsString()
  @IsEmail()
  mail?: string;

  @IsOptional()
  @IsString()
  password?: string;
}