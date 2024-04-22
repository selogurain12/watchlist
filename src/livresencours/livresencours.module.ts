import { Module } from '@nestjs/common';
import { LivresencoursService } from './livresencours.service';
import { LivresencoursController } from './livresencours.controller';

@Module({
  controllers: [LivresencoursController],
  providers: [LivresencoursService],
})
export class LivresencoursModule {}
