import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { Statuser } from './user/user.entity';
import { BookModule } from './Book/book.module';
import { MovieModule } from './Movie/movie.module';
import { UserMovieModule } from './UserMovie/usermovie.module';
import { FilmFilmotheque, Filmotheque } from './UserMovie/usermovie.entity';
import { Bibliotheque, LivreBibliotheque } from './UserBook/userbook.entity';
import { UserBookModule } from './UserBook/userbook.module';
import { Friendlist } from './Friendlist/friendlist.entity';
import { FriendlistModule } from './Friendlist/friendlist.module';
import { UserModule } from './users/users.module';
import { User } from './users/entities/user.entity';
import { MeModule } from './me/me.module';
import { Stats } from './me/entities/me.entity';

@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => ({
        type: 'postgres',
        host: configService.get<string>('DATABASE_HOST', 'localhost'),
        port: configService.get<number>('DATABASE_PORT', 5432),
        username: configService.get<string>('DATABASE_USERNAME', 'lora'),
        password: configService.get<string>('DATABASE_PASSWORD', 'Juemlochda2003!'),
        database: configService.get<string>('DATABASE_NAME', 'watchlist'),
        entities: [User, Stats, Statuser, Filmotheque, FilmFilmotheque, Bibliotheque, LivreBibliotheque, Friendlist],
        synchronize: true,
      }),
      inject: [ConfigService],
    }),
    BookModule,
    MovieModule,
    UserMovieModule,
    UserBookModule,
    FriendlistModule,
    UserModule,
    MeModule
  ],
  providers: [ConfigService],
})
export class AppModule {}