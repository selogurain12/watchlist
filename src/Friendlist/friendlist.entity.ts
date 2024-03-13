import { Column, Entity, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Friendlist {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    userprincipal: string

    @Column()
    user2: string
}

export class userprincipalDto{
    userprincipal: string;
}

export class userfriendDto{
    userprincipal: string;
    user2: string;
}