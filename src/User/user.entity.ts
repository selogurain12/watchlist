import { Entity, PrimaryGeneratedColumn, Column, Unique, PrimaryColumn } from "typeorm";

@Entity()
@Unique(["mail"])
@Unique(["username"])
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  username: string;

  @Column()
  nom: string;

  @Column()
  prenom: string;

  @Column()
  mail: string;

  @Column()
  mdp: string;
}

@Entity()
export class Statuser {
  @PrimaryColumn('uuid')
  iduser: string;

  @Column()
  filmsvu: number;

  @Column()
  tempsvu: number;

  @Column()
  livreslu: number;

  @Column()
  pageslu: number;
}

export class LoginDto{
    username: string;
    mdp: string;
}

export class MeDto{
  id: string;
  nom: string;
  prenom: string;
  username: string;
}

export class Username {
  username: string;
}