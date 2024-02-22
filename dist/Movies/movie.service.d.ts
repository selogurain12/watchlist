import { HttpService } from "@nestjs/axios/dist";
import { Repository } from "typeorm";
import { Movie } from "./movie.entity";
export declare class MovieService {
    private readonly movieRepository;
    private readonly httpService;
    private genres;
    constructor(movieRepository: Repository<Movie>, httpService: HttpService);
    loadGenres(): Promise<void>;
    searchmovie(query: string): Promise<Movie[]>;
}
