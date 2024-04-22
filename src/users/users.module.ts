import { Module } from '@nestjs/common';
import { UserService } from './users.service';
import { UserController } from './users.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { MeService } from '../me/me.service';
import { Stats } from '../me/entities/me.entity';
import { FriendslistService } from '../friendslist/friendslist.service';
import { Friendslist } from '../friendslist/entities/friendslist.entity';
import { Filmotheque } from '../filmotheque/entities/filmotheque.entity';
import { FilmothequeService } from '../filmotheque/filmotheque.service';
import { Bibliotheque } from '../bibliotheque/entities/bibliotheque.entity';
import { BibliothequeService } from '../bibliotheque/bibliotheque.service';
import { MovieService } from '../Movie/movie.service';
import { BookService } from '../Book/book.service';

@Module({
  imports: [TypeOrmModule.forFeature([User, Stats, Friendslist, Filmotheque, Bibliotheque])],
  controllers: [UserController],
  providers: [UserService, MeService, FriendslistService, FilmothequeService, BibliothequeService, MovieService, BookService],
})
export class UserModule {}
