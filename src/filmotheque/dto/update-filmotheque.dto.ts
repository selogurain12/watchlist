import { PartialType } from '@nestjs/swagger';
import { CreateFilmothequeDto } from './create-filmotheque.dto';
import { IsNotEmpty, IsOptional } from 'class-validator';
import { User } from '../../users/entities/user.entity';

export class UpdateFilmothequeDto extends PartialType(CreateFilmothequeDto) {
    @IsOptional()
    nom?: string;

    @IsOptional()
    users?: User[];
}
