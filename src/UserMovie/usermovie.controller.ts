import { Body, Controller, Post } from "@nestjs/common";
import { FilmFilmotheque, Filmotheque, searchfilmoDto } from "./usermovie.entity";
import { UserMovieService } from "./usermovie.service";
import { Movie } from "../Movie/movie.entity";

@Controller("user/me")
export class UserMovieController {
    constructor(private readonly usermovieService: UserMovieService) {}
    
    @Post("addfilmotheque")
    async createfilmotheque(@Body() filmo: Filmotheque): Promise<Filmotheque> {
        return await this.usermovieService.createfilmotheque(filmo);
    }

    @Post("filmotheques")
    async filmotheque(@Body() id: searchfilmoDto): Promise<Filmotheque[]> {
        return await this.usermovieService.filmotheque(id);
    }

    @Post("filmotheque/addmovie")
    async addmovie(@Body() movie: FilmFilmotheque): Promise<FilmFilmotheque> {
        return await this.usermovieService.addmovie(movie);
    }

    @Post("filmotheque/movies")
    async listmovie(@Body() filmotheque: searchfilmoDto): Promise<[FilmFilmotheque, Movie][]> {
        return await this.usermovieService.listmovie(filmotheque)
    }
}