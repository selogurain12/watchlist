import { Body, Controller, Post } from "@nestjs/common";
import { Bibliotheque, LivreBibliotheque, searchbiblioDto } from "./userbook.entity";
import { Book } from "../Book/book.entity";
import { UserBookService } from "./userbook.service";

@Controller("user/me")
export class UserBookController {
    constructor(private readonly userbookService: UserBookService) {}
    
    @Post("addbibliotheque")
    async createbibliotheque(@Body() biblio: Bibliotheque): Promise<Bibliotheque> {
        return await this.userbookService.createbibliotheque(biblio);
    }

    @Post("bibliotheque")
    async bibliotheque(@Body() id: searchbiblioDto): Promise<Bibliotheque[]> {
        return await this.userbookService.bibliotheque(id);
    }

    @Post("bibliotheque/addbook")
    async addbook(@Body() book: LivreBibliotheque): Promise<LivreBibliotheque> {
        return await this.userbookService.addbook(book);
    }

    @Post("bibliotheque/book")
    async listbook(@Body() bibliotheque: searchbiblioDto): Promise<[LivreBibliotheque, Book][]> {
        return await this.userbookService.listbook(bibliotheque)
    }
}