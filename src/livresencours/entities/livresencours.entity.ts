import { PrimaryGeneratedColumn, Column, ManyToOne, Entity } from "typeorm";
import { User } from "../../users/entities/user.entity";

@Entity()
export class Livresencours {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    nbpageslus: number;

    @Column()
    id_livre: string;

    @ManyToOne(() => User)
    user: User;
}
