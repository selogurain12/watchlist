import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateBibliothequeDto } from './dto/create-bibliotheque.dto';
import { UpdateBibliothequeDto } from './dto/update-bibliotheque.dto';
import { Bibliotheque } from './entities/bibliotheque.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from '../users/entities/user.entity';
import { Repository } from 'typeorm';

@Injectable()
export class BibliothequeService {
  constructor(
    @InjectRepository(Bibliotheque)
    public readonly bibliothequeRepository: Repository<Bibliotheque>,
    @InjectRepository(User)
    public readonly userRepository: Repository<User>,
  ){}
  async create(createBibliothequeDto: CreateBibliothequeDto) {
    const existingBibliotheque = await this.bibliothequeRepository.findOne({where: {
      nom: createBibliothequeDto.nom,
      users: createBibliothequeDto.users
    }})
    if(existingBibliotheque){
      throw new ConflictException("This bibliotheque already exist")
    }
    const newBibliotheque = this.bibliothequeRepository.create({
      nom: createBibliothequeDto.nom,
      users: createBibliothequeDto.users
    })
    return this.bibliothequeRepository.save(newBibliotheque);
  }

  findAll(user: User) {
    return this.bibliothequeRepository.find({where: 
      {users: user},
      relations: ["users"]
    });
  }

  async update(id: string, updateBibliothequeDto: UpdateBibliothequeDto) {
    const existingBibliotheque = await this.bibliothequeRepository.findOne({
      where: {id},
      relations: ["users"]
    })
    if(!existingBibliotheque){
      throw new NotFoundException("This bibliotheque dosen't exist")
    }
    if (updateBibliothequeDto.nom) {
      existingBibliotheque.nom = updateBibliothequeDto.nom;
  }
    const newUserIds = updateBibliothequeDto.users.map(user => user.id);
    const existingUsersIds = existingBibliotheque.users.map(user => user.id)
    for (const userId of newUserIds) {
      if(!existingUsersIds.includes(userId)) {
        const newUser = await this.userRepository.findOne({
          where: {id: userId}
        })
        if(newUser) {
          existingBibliotheque.users.push(newUser)
        }
      }
    }
    await this.bibliothequeRepository.save(existingBibliotheque)
    return existingBibliotheque;
  }

  async removeUserBibliotheque(id: string, user: User) {
    const bibliotheque = await this.bibliothequeRepository.findOne({
        where: { id },
        relations: ['users']
    });

    if (!bibliotheque) {
        throw new NotFoundException("This bibliotheque doesn't exist");
    }
    const updatedUsers = bibliotheque.users.filter(finduser => finduser.id !== user.id);
    bibliotheque.users = updatedUsers;
    await this.bibliothequeRepository.save(bibliotheque);
}


  async remove(id: string) {
    const bibliotheque = await this.bibliothequeRepository.findOne({
      where: {id}
    });
    if (!bibliotheque) {
      throw new NotFoundException("This bibliotheque dosen't exist");
    }
    this.bibliothequeRepository.delete(bibliotheque.id);
  }
}
