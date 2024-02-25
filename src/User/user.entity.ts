import { Entity, PrimaryGeneratedColumn, Column, Unique } from "typeorm";

@Entity()
@Unique(["mail"])
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: number;

  @Column()
  nom: string;

  @Column()
  prenom: string;

  @Column()
  mail: string;

  @Column()
  mdp: string;
}

export class LoginDto{
    mail: string;
    mdp: string;
}