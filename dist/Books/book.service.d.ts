import { HttpService } from "@nestjs/axios/dist";
import { Book } from "./book.entity";
import { Repository } from "typeorm";
export declare class BookService {
    private readonly bookRepository;
    private readonly httpService;
    constructor(bookRepository: Repository<Book>, httpService: HttpService);
    searchbook(q: string): Promise<Book[]>;
}
