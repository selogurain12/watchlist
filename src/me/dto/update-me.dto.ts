import { PartialType } from '@nestjs/swagger';
import { CreateMeDto } from './create-me.dto';
import { IsNumber, IsOptional } from 'class-validator';

export class UpdateMeDto{

    @IsOptional()
    @IsNumber()
    tempsvu!: number;
  
    @IsOptional()
    @IsNumber()
    pageslu!: number;
}
