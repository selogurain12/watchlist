import { IsNotEmpty, IsNumber, IsString } from "class-validator";
import { User } from "../../users/entities/user.entity";

export class CreateFilmsencoursDto {
    @IsNotEmpty()
    @IsNumber()
    tempsvisionnage: number;

    @IsNotEmpty()
    @IsString()
    id_film: string;

    @IsNotEmpty()
    user: User;
}
