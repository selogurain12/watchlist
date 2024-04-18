import { ConflictException, Injectable, NotFoundException } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { In, QueryFailedError, Repository } from "typeorm";
import { Movie } from "../Movie/movie.entity";
import { MovieService } from "../Movie/movie.service";
import { Bibliotheque, LivreBibliotheque, biblioDto, searchbiblioDto } from "./userbook.entity";
import { Book } from "../Book/book.entity";
import { BookService } from "../Book/book.service";

@Injectable()
export class UserBookService {
  constructor(
    @InjectRepository(Bibliotheque)
    private readonly bibliothequeRepository: Repository<Bibliotheque>,
    @InjectRepository(LivreBibliotheque)
    private readonly livrebibliothequeRepository: Repository<LivreBibliotheque>,
    private readonly bookService: BookService,
  ) {}
    async createbibliotheque(biblio: Bibliotheque): Promise<Bibliotheque> {
        try {
        const newBibliotheque = this.bibliothequeRepository.create(biblio);
      const bibliotheque = await this.bibliothequeRepository.save(newBibliotheque);
      return bibliotheque;
    } catch (error) {
        if (error instanceof QueryFailedError && error.message.includes('duplicate key')) {
          throw new ConflictException('Il y a déjà une bibliotheque avec ce nom');
        }
        throw error;
      }
    }

    async listbibliotheque(id: searchbiblioDto): Promise<Bibliotheque[]> {
    return await this.bibliothequeRepository.find({where: {
            id_user: id.id
    }})
    }

    async addbook(book: LivreBibliotheque): Promise<LivreBibliotheque> {
        const newbook =  this.livrebibliothequeRepository.create(book);
        return await this.livrebibliothequeRepository.save(newbook);
    }

    async listbook(bibliotheque: biblioDto): Promise<Book[]> {
      //console.log(bibliotheque)
      const livres = await this.livrebibliothequeRepository.find({ where: { id_bibliotheque: bibliotheque.id_bibliotheque } });
      console.log(livres)
      const bookIds = livres.map((livre) => livre.id_livre);
      //console.log(bookIds)
      const books = await Promise.all(bookIds.map(id => this.bookService.getBook(id)));
      //console.log(books)
      return books;
      }
      
      async renamebibliotheque(bibliotheque: Bibliotheque): Promise<Bibliotheque> {
        const existingBibliotheque = await this.bibliothequeRepository.findOne({ where: { id: bibliotheque.id, id_user: bibliotheque.id_user } });
        if (!existingBibliotheque) {
          throw new Error('Bibliotheque not found');
        }
        existingBibliotheque.nom = bibliotheque.nom;
        const newBibliotheque = await this.bibliothequeRepository.save(existingBibliotheque);
        return newBibliotheque;
      }

      async deletebibliotheque(idbibliotheque: biblioDto): Promise<void> {
        const bibliotheque = await this.bibliothequeRepository.findOne({
          where: {
            id: idbibliotheque.id_bibliotheque,
          },
        });
  
        const books = await this.livrebibliothequeRepository.find({
          where:{
            id_bibliotheque: idbibliotheque.id_bibliotheque,
          }
        })
      
        if (!bibliotheque) {
          throw new NotFoundException('Bibliotheque relation not found.');
        }
      
        const result = await this.bibliothequeRepository.delete(bibliotheque.id); 
  
        books.map((book) => this.livrebibliothequeRepository.delete(book.id))
      
        if (result.affected === 0) {
          throw new NotFoundException('Failed to delete the bibliotheque relation.');
        }
      }
  
      async deletebook(bibliothequebook: LivreBibliotheque): Promise<void> {
        const book = await this.livrebibliothequeRepository.findOne({
          where: {
            id: bibliothequebook.id,
          },
        });
      
        if (!book) {
          throw new NotFoundException('Book relation not found.');
        }
      
        const result = await this.livrebibliothequeRepository.delete(book.id); 
  
        if (result.affected === 0) {
          throw new NotFoundException('Failed to delete the book relation.');
        }
      }
  }