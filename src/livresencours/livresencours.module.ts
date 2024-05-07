import { Module } from '@nestjs/common';
import { LivresencoursService } from './livresencours.service';
import { LivresencoursController } from './livresencours.controller';
import { Livresencours } from './entities/livresencours.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Livresencours])],
  controllers: [LivresencoursController],
  providers: [LivresencoursService],
})
export class LivresencoursModule {}
