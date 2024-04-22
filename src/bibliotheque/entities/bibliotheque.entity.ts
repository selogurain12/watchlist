import { Column, Entity, JoinTable, ManyToMany, PrimaryGeneratedColumn } from "typeorm";
import { User } from "../../users/entities/user.entity";

@Entity()
export class Bibliotheque {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    nom: string;

    @Column("text", { array: true, default: [] })
    id_livres: string[];

    @ManyToMany(() => User, user => user.bibliotheques)
    @JoinTable()
    users: User[];
}
