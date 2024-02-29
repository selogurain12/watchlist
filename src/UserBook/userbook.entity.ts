import { Column, Entity, PrimaryGeneratedColumn, Unique } from "typeorm";

@Entity()
@Unique(["nom"])
export class Bibliotheque {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    nom: string;

    @Column('uuid')
    id_user: string;
}

@Entity()
@Unique(["id_book"])
export class LivreBibliotheque {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column("uuid")
    id_bibliotheque: string;

    @Column()
    id_book: string;
}

export class searchbiblioDto {
    id: string;
}