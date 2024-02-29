import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { UserModule } from './user/user.module';
import { Statuser, User } from './user/user.entity';
import { BookModule } from './Book/book.module';
import { MovieModule } from './Movie/movie.module';
import { UserMovieModule } from './UserMovie/usermovie.module';
import { FilmFilmotheque, Filmotheque } from './UserMovie/usermovie.entity';
import { Bibliotheque, LivreBibliotheque } from './UserBook/userbook.entity';
import { UserBookModule } from './UserBook/userbook.module';

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
        entities: [User, Statuser, Filmotheque, FilmFilmotheque, Bibliotheque, LivreBibliotheque],
        synchronize: true,
      }),
      inject: [ConfigService],
    }),
    UserModule,
    BookModule,
    MovieModule,
    UserMovieModule,
    UserBookModule
  ],
  providers: [ConfigService],
})
export class AppModule {}