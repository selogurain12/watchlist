import { PartialType } from '@nestjs/swagger';
import { CreateBibliothequeDto } from './create-bibliotheque.dto';
import { IsOptional } from 'class-validator';
import { User } from '../../users/entities/user.entity';

export class UpdateBibliothequeDto extends PartialType(CreateBibliothequeDto) {
    @IsOptional()
    nom?: string;

    @IsOptional()
    users?: User[];
}
