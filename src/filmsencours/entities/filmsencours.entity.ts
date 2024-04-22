import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { User } from "../../users/entities/user.entity";

@Entity()
export class Filmsencours {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    tempsvisionnage: number;

    @Column()
    id_film: string;

    @ManyToOne(() => User)
    user: User;
}
