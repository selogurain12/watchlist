import { Module } from '@nestjs/common';
import { LivrestermineService } from './livrestermine.service';
import { LivrestermineController } from './livrestermine.controller';
import { Livrestermine } from './entities/livrestermine.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { BookService } from '../Book/book.service';

@Module({
  imports: [TypeOrmModule.forFeature([Livrestermine])],
  controllers: [LivrestermineController],
  providers: [LivrestermineService, BookService],
  exports: [LivrestermineService]
})
export class LivrestermineModule {}
