import { IsNotEmpty, MinLength, IsString, IsArray, ArrayNotEmpty, IsOptional } from "class-validator";
import { User } from "../../users/entities/user.entity";

export class CreateBibliothequeDto {
    @IsNotEmpty()
    @MinLength(2)
    @IsString()
    nom!: string;

    @IsArray()
    @ArrayNotEmpty()
    users!: User[];

    @IsOptional()
    @IsArray()
    id_livres: string[];
}
