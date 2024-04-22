import { Module } from '@nestjs/common';
import { LivrestermineService } from './livrestermine.service';
import { LivrestermineController } from './livrestermine.controller';

@Module({
  controllers: [LivrestermineController],
  providers: [LivrestermineService],
})
export class LivrestermineModule {}
