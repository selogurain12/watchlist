import { PartialType } from '@nestjs/swagger';
import { CreateLivresencoursDto } from './create-livresencours.dto';
import { IsNotEmpty, IsNumber } from 'class-validator';

export class UpdateLivresencoursDto extends PartialType(CreateLivresencoursDto) {
    @IsNotEmpty()
    @IsNumber()
    nbpageslus?: number;
}
