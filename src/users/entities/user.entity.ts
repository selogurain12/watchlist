import { Entity, PrimaryGeneratedColumn, Column, Unique } from "typeorm";

@Entity()
@Unique(["mail"])
@Unique(["username"])
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({unique: true})
  username: string;

  @Column()
  nom: string;

  @Column()
  prenom: string;

  @Column({unique: true})
  mail: string;

  @Column({select: false})
  mdp: string;
}