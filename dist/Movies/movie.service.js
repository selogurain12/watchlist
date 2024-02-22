"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MovieService = void 0;
const common_1 = require("@nestjs/common");
const dist_1 = require("@nestjs/axios/dist");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const rxjs_1 = require("rxjs");
const movie_entity_1 = require("./movie.entity");
let MovieService = class MovieService {
    constructor(movieRepository, httpService) {
        this.movieRepository = movieRepository;
        this.httpService = httpService;
        this.genres = [];
        this.loadGenres();
    }
    async loadGenres() {
        const apiUrl = 'https://api.themoviedb.org/3/genre/movie/list?api_key=5dab12725eee000f48841e59fcf60567&language=fr-FR';
        const response = await (0, rxjs_1.firstValueFrom)(this.httpService.get(apiUrl));
        if (response.data && response.data.genres) {
            this.genres = response.data.genres;
        }
    }
    async searchmovie(query) {
        const apiUrl = `https://api.themoviedb.org/3/search/movie?api_key=5dab12725eee000f48841e59fcf60567&query=${query}&language=fr-FR`;
        console.log(apiUrl);
        const response = await (0, rxjs_1.firstValueFrom)(this.httpService.get(apiUrl));
        const data = response.data;
        if (data.results && data.results.length > 0) {
            const movies = data.results.map((movieItem) => {
                const genre_names = movieItem.genre_ids.map((id) => {
                    const genre = this.genres.find(genre => genre.id === id);
                    return genre ? genre.name : null;
                }).filter((name) => name !== null);
                return {
                    id: movieItem.id,
                    backdrop_path: movieItem.backdrop_path,
                    genre_ids: genre_names,
                    original_language: movieItem.original_language,
                    original_title: movieItem.original_title,
                    overview: movieItem.overview,
                    poster_path: movieItem.poster_path,
                    release_date: movieItem.release_date,
                    title: movieItem.title,
                };
            });
            console.log(movies);
            return movies;
        }
    }
};
exports.MovieService = MovieService;
exports.MovieService = MovieService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(movie_entity_1.Movie)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        dist_1.HttpService])
], MovieService);
//# sourceMappingURL=movie.service.js.map