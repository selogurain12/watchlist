import { IsNotEmpty, IsNumber, IsString } from "class-validator";
import { User } from "../../users/entities/user.entity";

export class CreateLivresencoursDto {
    @IsNotEmpty()
    @IsNumber()
    nbpageslus: number;

    @IsNotEmpty()
    @IsString()
    id_livre: string;

    @IsNotEmpty()
    user: User;
}
