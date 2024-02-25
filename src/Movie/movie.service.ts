import axios from 'axios';
import { Injectable } from '@nestjs/common';
import { Movie } from './movie.entity';

@Injectable()
export class MovieService {
  async getGenreList(): Promise<Record<number, string>> {
    try {
      const apiUrl = `https://api.themoviedb.org/3/genre/movie/list?api_key=5dab12725eee000f48841e59fcf60567&language=fr`;
      const response = await axios.get(apiUrl);
      const genres: Record<number, string> = {};

      response.data.genres.forEach((genre: any) => {
        genres[genre.id] = genre.name;
      });

      return genres;
    } catch (error) {
      throw error;
    }
  }

  async getDetailMovie(id: string): Promise<Movie> {
    try {
      const apiUrl = `https://api.themoviedb.org/3/movie/${id}?api_key=5dab12725eee000f48841e59fcf60567&language=fr-FR`;
      const response = await axios.get(apiUrl);

      const movieDetails: any = {
        budget: response.data.budget ?? '',
        homepage: response.data.homepage ?? '',
        revenue: response.data.revenue ?? '',
        runtime: response.data.runtime ?? '',
        vote_average: response.data.vote_average ?? '',
      };

      return movieDetails;
    } catch (error) {
      throw error;
    }
  }

  async searchmovie(query: string): Promise<Movie[]> {
    try {
      const genreList = await this.getGenreList();
      const apiUrl = `https://api.themoviedb.org/3/search/movie?api_key=5dab12725eee000f48841e59fcf60567&query=${query}&language=fr-FR`;
      const response = await axios.get(apiUrl);

      const movies: Movie[] = await Promise.all(
        response.data.results.map(async (item: any) => {
          const movieDetails = await this.getDetailMovie(item.id);

          // Merge movie details with existing properties
          const mergedMovie: Movie = {
            id: item.id,
            title: item.title,
            backdrop_path: item.backdrop_path,
            genre_ids: item.genre_ids.map((genreId: number) => genreList[genreId]),
            original_language: item.original_language,
            original_title: item.original_title,
            overview: item.overview,
            poster_path: item.poster_path,
            release_date: item.release_date,
            ...movieDetails,
          };

          return mergedMovie;
        })
      );

      return movies;
    } catch (error) {
      throw error;
    }
  }
}
