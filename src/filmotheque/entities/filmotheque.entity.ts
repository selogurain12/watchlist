import { Entity, Unique, PrimaryGeneratedColumn, Column, ManyToOne, ManyToMany, JoinTable } from "typeorm";
import { User } from "../../users/entities/user.entity";

@Entity()
export class Filmotheque {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    nom: string;

    @ManyToMany(() => User, user => user.filmotheques)
    @JoinTable()
    users: User[];
}