import { Movie } from "./movie.entity";
import { MovieService } from "./movie.service";
export declare class MovieController {
    private readonly movieService;
    constructor(movieService: MovieService);
    searchmovie(requestBody: {
        query: string;
    }): Promise<Movie[]>;
}
