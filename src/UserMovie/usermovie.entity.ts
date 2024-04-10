import { Column, Entity, PrimaryGeneratedColumn, Unique } from "typeorm";

@Entity()
@Unique(["nom"])
export class Filmotheque {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    nom: string;

    @Column('uuid')
    id_user: string;
}

@Entity()
@Unique(["id_film"])
export class FilmFilmotheque {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column("uuid")
    id_filmotheque: string;

    @Column()
    id_film: string;
}

export class searchfilmoDto {
    id: string;
}

export class filmoDto {
    id_filmotheque: string;
}