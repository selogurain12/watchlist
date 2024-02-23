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
exports.BookService = void 0;
const common_1 = require("@nestjs/common");
const dist_1 = require("@nestjs/axios/dist");
const typeorm_1 = require("@nestjs/typeorm");
const book_entity_1 = require("./book.entity");
const typeorm_2 = require("typeorm");
const rxjs_1 = require("rxjs");
let BookService = class BookService {
    constructor(bookRepository, httpService) {
        this.bookRepository = bookRepository;
        this.httpService = httpService;
    }
    async searchbook(q) {
        const apiUrl = 'https://www.googleapis.com/books/v1/volumes?q=' + q;
        const response = this.httpService.get(apiUrl);
        const { data } = await (0, rxjs_1.firstValueFrom)(response);
        if (data.items && data.items.length > 0) {
            const books = data.items.map((bookItem) => {
                var _a, _b, _c, _d, _e, _f, _g;
                return ({
                    id: bookItem.id,
                    title: bookItem.volumeInfo.title,
                    authors: bookItem.volumeInfo.authors,
                    publisher: bookItem.volumeInfo.publisher,
                    imageLink: bookItem.volumeInfo.imageLinks.thumbnail,
                    publisherDate: bookItem.volumeInfo.publishedDate,
                    description: bookItem.volumeInfo.description,
                    industryIdentifierstype: (_a = bookItem.volumeInfo.industryIdentifiers[0]) === null || _a === void 0 ? void 0 : _a.type,
                    industryIdentifieridentyfier: (_b = bookItem.volumeInfo.industryIdentifiers[0]) === null || _b === void 0 ? void 0 : _b.identifier,
                    pageCount: bookItem.volumeInfo.pageCount,
                    categories: bookItem.volumeInfo.categories,
                    retailPriceamount: (_d = (_c = bookItem.saleInfo) === null || _c === void 0 ? void 0 : _c.retailPrice) === null || _d === void 0 ? void 0 : _d.amount,
                    retailPricecurrencyCode: (_f = (_e = bookItem.saleInfo) === null || _e === void 0 ? void 0 : _e.retailPrice) === null || _f === void 0 ? void 0 : _f.currencyCode,
                    retailPricebuyLink: (_g = bookItem.saleInfo) === null || _g === void 0 ? void 0 : _g.buyLink
                });
            });
            console.log(books);
            return books;
        }
    }
};
exports.BookService = BookService;
exports.BookService = BookService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(book_entity_1.Book)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        dist_1.HttpService])
], BookService);
//# sourceMappingURL=book.service.js.map