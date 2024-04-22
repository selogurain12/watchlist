import { PartialType } from '@nestjs/swagger';
import { CreateLivrestermineDto } from './create-livrestermine.dto';

export class UpdateLivrestermineDto extends PartialType(CreateLivrestermineDto) {}
