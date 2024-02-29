// api.service.ts
import axios from 'axios';
import { Injectable } from '@nestjs/common';
import { Book } from './book.entity';

@Injectable()
export class BookService {
  async searchbook(q: string): Promise<Book[]> {
      const apiUrl = `https://www.googleapis.com/books/v1/volumes?q=${q}&maxResults=40`;
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

  async getBook(id: string): Promise<Book> {
    try {
    const apiUrl = `https://www.googleapis.com/books/v1/volumes/${id}`;
    const response = await axios.get(apiUrl);

    if (!response.data) {
      throw new Error(`Movie details not found in API response`);
    }

    const books: Book = {
      id: response.data.id,
      title: response.data.volumeInfo.title,
      authors: response.data.volumeInfo.authors,
      publisher: response.data.volumeInfo.publisher,
      imageLink: response.data.volumeInfo.imageLinks?.thumbnail,
      publisherDate: response.data.volumeInfo.publishedDate,
      description: response.data.volumeInfo.description,
      industryIdentifierstype: response.data.volumeInfo.industryIdentifiers?.[0]?.type,
      industryIdentifieridentyfier: response.data.volumeInfo.industryIdentifiers?.[0]?.identifier,
      pageCount: response.data.volumeInfo.pageCount,
      categories: response.data.volumeInfo.categories,
      retailPriceamount: response.data.saleInfo?.retailPrice?.amount,
      retailPricecurrencyCode: response.data.saleInfo?.retailPrice?.currencyCode,
      retailPricebuyLink: response.data.saleInfo?.buyLink,
    };
    return books
  } catch (error) {
    throw error;
  }
}
}
