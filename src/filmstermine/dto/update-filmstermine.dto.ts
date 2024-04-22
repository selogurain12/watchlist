import { PartialType } from '@nestjs/swagger';
import { CreateFilmstermineDto } from './create-filmstermine.dto';

export class UpdateFilmstermineDto extends PartialType(CreateFilmstermineDto) {}
