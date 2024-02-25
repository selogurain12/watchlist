// api.service.ts
import axios from 'axios';
import { Injectable } from '@nestjs/common';
import { Book } from './book.entity';

@Injectable()
export class BookService {
  async searchbook(q: string): Promise<Book[]> {
      const apiUrl = `https://www.googleapis.com/books/v1/volumes?q=${q}`;
      const response = await axios.get(apiUrl);

      const books: Book[] = response.data.items.map((item: any) => ({
        id: item.id,
        title: item.volumeInfo.title,
        authors: item.volumeInfo.authors,
        publisher: item.volumeInfo.publisher,
        imageLink: item.volumeInfo.imageLinks?.thumbnail,
        publisherDate: item.volumeInfo.publishedDate,
        description: item.volumeInfo.description,
        industryIdentifierstype: item.volumeInfo.industryIdentifiers?.[0]?.type,
        industryIdentifieridentyfier: item.volumeInfo.industryIdentifiers?.[0]?.identifier,
        pageCount: item.volumeInfo.pageCount,
        categories: item.volumeInfo.categories,
        retailPriceamount: item.saleInfo?.retailPrice?.amount,
        retailPricecurrencyCode: item.saleInfo?.retailPrice?.currencyCode,
        retailPricebuyLink: item.saleInfo?.buyLink,
      }));
      return books
  }
}
