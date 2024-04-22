import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { User } from "../../users/entities/user.entity";

@Entity()
export class Livrestermine {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column()
    id_livre: string;

    @ManyToOne(() => User)
    user: User;
}
