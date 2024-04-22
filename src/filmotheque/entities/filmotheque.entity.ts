import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable } from "typeorm";
import { User } from "../../users/entities/user.entity";

@Entity()
export class Filmotheque {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    nom: string;

    @Column("text", { array: true, default: [] })
    id_films: string[];

    @ManyToMany(() => User, user => user.filmotheques, {cascade: true})
    @JoinTable()
    users: User[];
}
