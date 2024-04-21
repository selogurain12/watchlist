import { PartialType } from '@nestjs/swagger';
import { CreateFriendslistDto } from './create-friendslist.dto';
import { IsNotEmpty } from 'class-validator';
import { User } from '../../users/entities/user.entity';

export class UpdateFriendslistDto extends PartialType(CreateFriendslistDto) {
    @IsNotEmpty()
    friends?: User[];
}
