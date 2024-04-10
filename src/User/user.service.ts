import { ConflictException, Injectable, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, QueryFailedError } from 'typeorm';
import { LoginDto, MeDto, Statuser, User, Username } from './user.entity';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
    @InjectRepository(Statuser)
    private readonly statRepository: Repository<Statuser>,
  ) {}

  async register(user: User): Promise<[User, Statuser]> {
    const existingUsername = await this.userRepository.findOne({
      where: { username: user.username },
    });
    const existingMail = await this.userRepository.findOne({
      where: { mail: user.mail },
    });
    if(existingUsername){
      throw new ConflictException('User with the same username already exists.');
    }
    if(existingMail){
      throw new ConflictException('User with the same username already exists.');
    }
      const newUser = this.userRepository.create(user);
      const saveuser = await this.userRepository.save(newUser);
      const stat = {
        iduser: saveuser.id,
        filmsvu: 0,
        tempsvu: 0,
        livreslu: 0,
        pageslu: 0
      }
      const savestat = this.statRepository.create(stat);
      const saved = await this.statRepository.save(savestat);
      const userwithoutpassword = {...saveuser};
    delete userwithoutpassword.mdp;
      return [userwithoutpassword, saved]
  }

  async login(login: LoginDto): Promise<User> {
    const utilisateur = await this.userRepository.findOne({ where: { username: login.username } });

    if (!utilisateur) {
      throw new NotFoundException('User not found');
    }

    if (login.mdp !== utilisateur.mdp) {
      throw new UnauthorizedException('Invalid credentials');
    }
    const utilisateurSansMdp = { ...utilisateur };
    delete utilisateurSansMdp.mdp;

    return utilisateurSansMdp;
  }

  async me(user: MeDto): Promise<[User, Statuser]> {
    const userFind = await this.userRepository.findOne({ where:{
        nom: user.nom,
        prenom: user.prenom,
        username: user.username
      }});
    const statUser = await this.statRepository.findOne({
      where:{
        iduser: user.id
      }
    })
    if (!userFind) {
      throw new NotFoundException('User not found');
    }
    const userwithoutpassword = {...userFind};
    delete userwithoutpassword.mdp;
    return [userwithoutpassword, statUser]
  }

  async searchuser(username: Username): Promise<User> {
    const userFind = await this.userRepository.findOne({where: {username: username.username}});
    if (!userFind) {
      throw new NotFoundException('User not found');
    }
    const userwithoutpassword = {...userFind};
    delete userwithoutpassword.mdp;
    return userwithoutpassword;
  }

  async statsuser(user: MeDto): Promise<Statuser> {
    const userFind = await this.userRepository.findOne({ where:{
      nom: user.nom,
      prenom: user.prenom,
      username: user.username
    }});
  const statUser = await this.statRepository.findOne({
    where:{
      iduser: user.id
    }
  })
  if (!userFind) {
    throw new NotFoundException('User not found');
  }
  return statUser
  }

  async updatestat(stat: Statuser): Promise<Statuser> {
    const statUser = await this.statRepository.findOne({
      where:{
        iduser: stat.iduser,
      }
    })
    statUser.filmsvu = statUser.filmsvu + stat.filmsvu;
    statUser.tempsvu = statUser.tempsvu + stat.tempsvu;
    statUser.livreslu = statUser.livreslu + stat.livreslu;
    statUser.pageslu = statUser.pageslu + stat.pageslu;

    const updatedStatUser = await this.statRepository.save(statUser);

    return updatedStatUser;
  }
}