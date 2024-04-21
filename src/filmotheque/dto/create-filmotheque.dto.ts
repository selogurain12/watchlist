import { ArrayNotEmpty, IsArray, IsNotEmpty, IsString, MinLength } from "class-validator";
import { User } from "../../users/entities/user.entity";

export class CreateFilmothequeDto {
    @IsNotEmpty()
    @MinLength(2)
    @IsString()
    nom!: string;

    @IsArray()
    @ArrayNotEmpty()
    users!: User[];
}
