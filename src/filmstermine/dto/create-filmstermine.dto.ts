import { IsNotEmpty, IsString } from "class-validator";
import { User } from "../../users/entities/user.entity";

export class CreateFilmstermineDto {
    @IsNotEmpty()
    @IsString()
    id_film: string;

    @IsNotEmpty()
    user: User;
}
