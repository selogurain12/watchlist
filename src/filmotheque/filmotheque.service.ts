import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateFilmothequeDto } from './dto/create-filmotheque.dto';
import { UpdateFilmothequeDto } from './dto/update-filmotheque.dto';
import { Filmotheque } from './entities/filmotheque.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from '../users/entities/user.entity';

@Injectable()
export class FilmothequeService {
  constructor(
    @InjectRepository(Filmotheque)
    public readonly filmothequeRepository: Repository<Filmotheque>,
    @InjectRepository(User)
    public readonly userRepository: Repository<User>,
  ){}

  async create(createFilmothequeDto: CreateFilmothequeDto) {
    const existingFilmotheque = await this.filmothequeRepository.findOne({where: {
      nom: createFilmothequeDto.nom,
      users: createFilmothequeDto.users
    }})
    if(existingFilmotheque){
      throw new ConflictException("This filmotheque already exist")
    }
    const newFilmotheque = this.filmothequeRepository.create({
      nom: createFilmothequeDto.nom,
      users: createFilmothequeDto.users
    })
    return this.filmothequeRepository.save(newFilmotheque);
  }

  findAll(user: User) {
    return this.filmothequeRepository.find({where: 
      {users: user},
      relations: ["users"]
    });
  }

  async update(id: string, updateFilmothequeDto: UpdateFilmothequeDto) {
    const existingFilmotheque = await this.filmothequeRepository.findOne({
      where: {id},
      relations: ["users"]
    })
    if(!existingFilmotheque){
      throw new NotFoundException("This filmotheque dosen't exist")
    }
    if (updateFilmothequeDto.nom) {
      existingFilmotheque.nom = updateFilmothequeDto.nom;
  }
    const newUserIds = updateFilmothequeDto.users.map(user => user.id);
    const existingUsersIds = existingFilmotheque.users.map(user => user.id)
    for (const userId of newUserIds) {
      if(!existingUsersIds.includes(userId)) {
        const newUser = await this.userRepository.findOne({
          where: {id: userId}
        })
        if(newUser) {
          existingFilmotheque.users.push(newUser)
        }
      }
    }
    await this.filmothequeRepository.save(existingFilmotheque)
    return existingFilmotheque;
  }

  async removeUserFilmotheque(id: string, user: User) {
    const filmotheque = await this.filmothequeRepository.findOne({
        where: { id },
        relations: ['users']
    });

    if (!filmotheque) {
        throw new NotFoundException("This filmotheque doesn't exist");
    }
    const updatedUsers = filmotheque.users.filter(finduser => finduser.id !== user.id);
    filmotheque.users = updatedUsers;
    await this.filmothequeRepository.save(filmotheque);
}


  async remove(id: string) {
    const filmotheque = await this.filmothequeRepository.findOne({
      where: {id}
    });
    if (!filmotheque) {
      throw new NotFoundException("This filmotheque dosen't exist");
    }
    this.filmothequeRepository.delete(filmotheque.id);
  }
}
