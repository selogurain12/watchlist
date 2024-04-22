import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { User } from "../../users/entities/user.entity";

@Entity()
export class Filmstermine {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column()
    id_film: string;

    @ManyToOne(() => User)
    user: User;
}
