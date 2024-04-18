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
@Unique(["id_livre"])
export class LivreBibliotheque {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column("uuid")
    id_bibliotheque: string;

    @Column()
    id_livre: string;
}

export class searchbiblioDto {
    id: string;
}

export class biblioDto {
    id_bibliotheque: string;
}