import { Entity, JoinTable, ManyToMany, ManyToOne, PrimaryGeneratedColumn, Unique } from "typeorm";
import { User } from "../../users/entities/user.entity";

@Entity()
@Unique(["user"])
export class Friendslist {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @ManyToOne(() => User)
    user: User;

    @ManyToMany(() => User, user => user.friends, {cascade: true})
    @JoinTable()
    friends: User[];
}
