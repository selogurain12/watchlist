import { Entity, PrimaryGeneratedColumn, Column, Unique, ManyToMany } from "typeorm";
import { Friendslist } from "../../friendslist/entities/friendslist.entity";
import { Filmotheque } from "../../filmotheque/entities/filmotheque.entity";
import { Bibliotheque } from "../../bibliotheque/entities/bibliotheque.entity";

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

  @ManyToMany(() => Friendslist, friendslist => friendslist.friends)
  friends: Friendslist[];

  @ManyToMany(() => Filmotheque, filmotheque => filmotheque.users)
  filmotheques: Filmotheque[];

  @ManyToMany(() => Bibliotheque, bibliotheque => bibliotheque.users)
  bibliotheques: Bibliotheque[];
}