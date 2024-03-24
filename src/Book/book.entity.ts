import { Column, Entity, PrimaryColumn } from "typeorm";

@Entity()
export class Book {
    @PrimaryColumn()
    id: string

    @Column()
    title: string

    @Column()
    authors: string[]

    @Column()
    publisher: string

    @Column()
    imageLink: string

    @Column()
    publisherDate: string

    @Column()
    description: string

    @Column()
    industryIdentifierstype: string

    @Column()
    industryIdentifieridentyfier: string

    @Column()
    pageCount: number

    @Column()
    categories: string[]

    @Column({nullable: true})
    retailPriceamount: number

    @Column()
    retailPricecurrencyCode: string

    @Column()
    retailPricebuyLink: string
}