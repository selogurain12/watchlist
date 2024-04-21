import { IsNotEmpty, IsOptional } from "class-validator";
import { User } from "../../users/entities/user.entity";

export class CreateFriendslistDto {
    @IsNotEmpty()
    user!: User;

    @IsOptional()
    friends?: User[];
}
