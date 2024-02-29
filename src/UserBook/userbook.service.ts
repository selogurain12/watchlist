import { ConflictException, Injectable, NotFoundException } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { In, QueryFailedError, Repository } from "typeorm";
import { Movie } from "../Movie/movie.entity";
import { MovieService } from "../Movie/movie.service";
import { Bibliotheque, LivreBibliotheque, searchbiblioDto } from "./userbook.entity";
import { Book } from "../Book/book.entity";
import { BookService } from "../Book/book.service";

@Injectable()
export class UserBookService {
  constructor(
    @InjectRepository(Bibliotheque)
    private readonly bibliothequeRepository: Repository<Bibliotheque>,
    @InjectRepository(LivreBibliotheque)
    private readonly livrebibliothequeRepository: Repository<LivreBibliotheque>,
    @InjectRepository(Book)
    private readonly bookRepository: Repository<Book>,
    private readonly bookService: BookService,
  ) {}
    async createbibliotheque(biblio: Bibliotheque): Promise<Bibliotheque> {
        try {
        const newBibliotheque = this.bibliothequeRepository.create(biblio);
      const bibliotheque = await this.bibliothequeRepository.save(newBibliotheque);
      return bibliotheque;
    } catch (error) {
        if (error instanceof QueryFailedError && error.message.includes('duplicate key')) {
          throw new ConflictException('Il y a déjà une filmothèque avec ce nom');
        }
        throw error;
      }
    }

    async bibliotheque(id: searchbiblioDto): Promise<Bibliotheque[]> {
    return await this.bibliothequeRepository.find({where: {
            id_user: id.id
    }})
    }

    async addbook(book: LivreBibliotheque): Promise<LivreBibliotheque> {
        const newbook =  this.livrebibliothequeRepository.create(book);
        return await this.livrebibliothequeRepository.save(newbook);
    }

    // Assuming 'id' is of type 'number' in both FilmFilmotheque and Movie entities

    async listbook(bibliotheque: searchbiblioDto): Promise<[LivreBibliotheque, Book][]> {
        const livres = await this.livrebibliothequeRepository.find({ where: { id_bibliotheque: bibliotheque.id } });
      
        if (!livres || livres.length === 0) {
          throw new NotFoundException('No books found for the given filmotheque ID');
        }
      
        const livreDetails: Promise<[LivreBibliotheque, Book][]> = Promise.all(
          livres.map(async (livre) => {
            const book = await this.bookService.getBook(livre.id_book);
            return [livre, book];
          })
        );
      
        return livreDetails;
      }
      
  }