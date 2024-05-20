import { Column, Entity, ManyToOne, PrimaryColumn, PrimaryGeneratedColumn, Unique } from "typeorm";
import { User } from "../../users/entities/user.entity";

@Entity()
@Unique(["user"])
export class Stats {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @ManyToOne(() => User)
    user: User;

    @Column()
    tempsvu: number;

    @Column()
    pageslu: number;
}
