import { IsNotEmpty, IsString } from "class-validator";
import { User } from "../../users/entities/user.entity";

export class CreateLivrestermineDto {
    @IsNotEmpty()
    @IsString()
    id_livre: string;

    @IsNotEmpty()
    user: User;
}
