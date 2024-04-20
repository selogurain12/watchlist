import { PartialType } from '@nestjs/swagger';
import { CreateMeDto } from './create-me.dto';
import { IsNumber, IsOptional } from 'class-validator';

export class UpdateMeDto{
    @IsOptional()
    @IsNumber()
    filmsvu!: number;

    @IsOptional()
    @IsNumber()
    tempsvu!: number;
  
    @IsOptional()
    @IsNumber()
    livreslu!: number;
  
    @IsOptional()
    @IsNumber()
    pageslu!: number;
}
