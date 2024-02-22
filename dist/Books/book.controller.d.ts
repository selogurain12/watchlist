import { Book } from "./book.entity";
import { BookService } from "./book.service";
export declare class BookController {
    private readonly bookService;
    constructor(bookService: BookService);
    searchbook(requestBody: {
        q: string;
    }): Promise<Book[]>;
}
