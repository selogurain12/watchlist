import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { BookModule } from './Book/book.module';
import { MovieModule } from './movie/movie.module';
import { UserModule } from './users/users.module';
import { User } from './users/entities/user.entity';
import { MeModule } from './me/me.module';
import { Stats } from './me/entities/me.entity';
import { FriendslistModule } from './friendslist/friendslist.module';
import { Friendslist } from './friendslist/entities/friendslist.entity';
import { BibliothequeModule } from './bibliotheque/bibliotheque.module';
import { FilmothequeModule } from './filmotheque/filmotheque.module';
import { Filmotheque } from './filmotheque/entities/filmotheque.entity';
import { Bibliotheque } from './bibliotheque/entities/bibliotheque.entity';
import { FilmsencoursModule } from './filmsencours/filmsencours.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: (configService: ConfigService) => ({
        type: 'postgres',
        host: configService.get<string>('DATABASE_HOST', 'localhost'),
        port: configService.get<number>('DATABASE_PORT', 5432),
        username: configService.get<string>('DATABASE_USERNAME', 'lora'),
        password: configService.get<string>('DATABASE_PASSWORD', 'Juemlochda2003!'),
        database: configService.get<string>('DATABASE_NAME', 'watchlist'),
        entities: [User, Stats, Bibliotheque, Friendslist, Filmotheque],
        synchronize: true,
      }),
      inject: [ConfigService],
    }),
    BookModule,
    MovieModule,
    UserModule,
    MeModule,
    FriendslistModule,
    BibliothequeModule,
    FilmothequeModule,
    FilmsencoursModule,
  ],
  providers: [ConfigService],
})
export class AppModule {}