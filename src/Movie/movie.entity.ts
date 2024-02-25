import { Column, Entity, PrimaryColumn } from "typeorm";

@Entity()
export class Movie {
    @PrimaryColumn()
    id: number

    @Column({nullable: true})
    backdrop_path: string

    @Column()
    genre_ids: string[]

    @Column()
    original_language: string
    
    @Column()
    original_title: string

    @Column()
    overview: string

    @Column()
    poster_path: string

    @Column()
    release_date: string

    @Column()
    title: string

    @Column()
    budget: number

    @Column()
    homepage: string

    @Column()
    revenue: number

    @Column()
    runtime: number

    @Column()
    vote_average: number
}