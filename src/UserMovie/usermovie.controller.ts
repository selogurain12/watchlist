import { Body, Controller, Delete, Post } from "@nestjs/common";
import { FilmFilmotheque, Filmotheque, filmoDto, searchfilmoDto } from "./usermovie.entity";
import { UserMovieService } from "./usermovie.service";
import { Movie } from "../Movie/movie.entity";

@Controller("user/me")
export class UserMovieController {
    constructor(private readonly usermovieService: UserMovieService) {}
    
    @Post("addfilmotheque")
    async createfilmotheque(@Body() filmo: Filmotheque): Promise<Filmotheque> {
        return await this.usermovieService.createfilmotheque(filmo);
    }

    @Post("listfilmotheques")
    async filmotheque(@Body() id: searchfilmoDto): Promise<Filmotheque[]> {
        return await this.usermovieService.listfilmotheque(id);
    }

    @Post("filmotheque/addmovie")
    async addmovie(@Body() movie: FilmFilmotheque): Promise<FilmFilmotheque> {
        return await this.usermovieService.addmovie(movie);
    }

    @Post("filmotheque/listmovies")
    async listmovie(@Body() filmotheque: filmoDto): Promise<Movie[]> {
        return await this.usermovieService.listmovie(filmotheque)
    }

    @Post("/renamefilmotheques")
    async renamefilmotheque(@Body() filmotheque: Filmotheque): Promise<Filmotheque> {
        return await this.usermovieService.renamefilmotheque(filmotheque);
    }

    @Delete('filmotheque')
    async deletefilmotheque(@Body() filmotheque: filmoDto): Promise<void> {
        console.log(filmotheque);
      return await this.usermovieService.deletefilmotheque(filmotheque);
    }

    @Delete('filmotheque/movie')
    async deletemovie(@Body() movie: FilmFilmotheque): Promise<void> {
      return await this.usermovieService.deletemovie(movie);
    }
}