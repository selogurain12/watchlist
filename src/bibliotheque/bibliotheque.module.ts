import { Module } from '@nestjs/common';
import { BibliothequeService } from './bibliotheque.service';
import { BibliothequeController } from './bibliotheque.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Bibliotheque } from './entities/bibliotheque.entity';
import { User } from '../users/entities/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([User, Bibliotheque])],
  controllers: [BibliothequeController],
  providers: [BibliothequeService],
})
export class BibliothequeModule {}
