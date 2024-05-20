import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateBibliothequeDto } from './dto/create-bibliotheque.dto';
import { UpdateBibliothequeDto } from './dto/update-bibliotheque.dto';
import { Bibliotheque } from './entities/bibliotheque.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from '../users/entities/user.entity';
import { Repository } from 'typeorm';
import { BookService } from '../Book/book.service';
import { Book } from '../Book/book.entity';

@Injectable()
export class BibliothequeService {
  constructor(
    @InjectRepository(Bibliotheque)
    public readonly bibliothequeRepository: Repository<Bibliotheque>,
    @InjectRepository(User)
    public readonly userRepository: Repository<User>,
    private readonly bookService: BookService,
  ){}
  async create(createBibliothequeDto: CreateBibliothequeDto) {
    for (const user of createBibliothequeDto.users) {
      // Check if the user already has a bibliothèque with the same name
      const existingBibliotheque = await this.bibliothequeRepository.createQueryBuilder('bibliotheque')
        .leftJoin('bibliotheque.users', 'user')
        .where('bibliotheque.nom = :nom', { nom: createBibliothequeDto.nom })
        .andWhere('user.id = :userId', { userId: user.id })
        .getOne();

      if (existingBibliotheque) {
        throw new ConflictException(`User ${user.id} already has a bibliothèque with the name ${createBibliothequeDto.nom}`);
      }
    }

    const newBibliotheque = this.bibliothequeRepository.create({
      nom: createBibliothequeDto.nom,
      users: createBibliothequeDto.users,
      id_livres: createBibliothequeDto.id_livres || []
    });

    return this.bibliothequeRepository.save(newBibliotheque);
  }

  findAll(user: User) {
    return this.bibliothequeRepository.find({where: 
      {users: {
        id: user.id
      }},
      relations: ["users"]
    });
  }

  countAll(users: User) {
    return this.bibliothequeRepository.count({where: 
      {users: {
        id: users.id
      }},
      relations: ["users"]
    });
  }

  async listBookinBibliotheque(id: string): Promise<Book[]> {
    const bibliotheque = await this.bibliothequeRepository.findOne({where: {id}});
    if (!bibliotheque) {
      throw new NotFoundException("This bibliotheque doesn't exist");
    }
    const bookIds = bibliotheque.id_livres;
    const books = await Promise.all(bookIds.map(id => this.bookService.getBook(id)));
    return books;
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
  if (updateBibliothequeDto.id_livres) {
    const currentIds = new Set(existingBibliotheque.id_livres || []);
    updateBibliothequeDto.id_livres.forEach(id => currentIds.add(id));
    existingBibliotheque.id_livres = Array.from(currentIds);
}
if (updateBibliothequeDto.users && updateBibliothequeDto.users.length) {
  const newUserIds = updateBibliothequeDto.users.map(user => user.id);
  const existingUsersIds = existingBibliotheque.users.map(user => user.id);
  const newUsers = [];

  for (const userId of newUserIds) {
    if (!existingUsersIds.includes(userId)) {
      const newUser = await this.userRepository.findOne({where: {id: userId}});
      if (newUser) {
        newUsers.push(newUser);
      }
    }
  }

  existingBibliotheque.users = [...existingBibliotheque.users, ...newUsers];
}

await this.bibliothequeRepository.save(existingBibliotheque);
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
    return bibliotheque;
}

async removeLivreFromBibliotheque(id: string, livreIdsToRemove: string[]): Promise<Bibliotheque> {
  const bibliotheque = await this.bibliothequeRepository.findOne({
    where: { id },
    relations:["users"]
  });

  if (!bibliotheque) {
    throw new NotFoundException("This bibliotheque doesn't exist");
  }

  bibliotheque.id_livres = bibliotheque.id_livres.filter(id => !livreIdsToRemove.includes(id));

  await this.bibliothequeRepository.save(bibliotheque);
  return bibliotheque;
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
