import { PartialType } from '@nestjs/swagger';
import { CreateFilmsencoursDto } from './create-filmsencours.dto';
import { IsNotEmpty, IsNumber } from 'class-validator';

export class UpdateFilmsencoursDto extends PartialType(CreateFilmsencoursDto) {
    @IsNotEmpty()
    @IsNumber()
    tempsvisionnage?: number;
}
