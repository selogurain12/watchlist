import { Module } from '@nestjs/common';
import { LivrestermineService } from './livrestermine.service';
import { LivrestermineController } from './livrestermine.controller';
import { Livrestermine } from './entities/livrestermine.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Livrestermine])],
  controllers: [LivrestermineController],
  providers: [LivrestermineService],
})
export class LivrestermineModule {}
