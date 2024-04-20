import {
    IsString,
    IsEmail,
    IsNotEmpty,
    MinLength,
  } from 'class-validator';
  export class CreateUserDto {
    @IsNotEmpty()
    @MinLength(3)
    @IsString()
    username!: string;

    @IsNotEmpty()
    @MinLength(1)
    @IsString()
    nom!: string;

    @IsNotEmpty()
    @MinLength(2)
    @IsString()
    prenom!: string;
  
    @IsNotEmpty()
    @IsString()
    @IsEmail()
    mail!: string;
  
    @IsNotEmpty()
    @IsString()
    @MinLength(8)
    mdp!: string;
  }