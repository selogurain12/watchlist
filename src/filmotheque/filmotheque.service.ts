import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateFilmothequeDto } from './dto/create-filmotheque.dto';
import { UpdateFilmothequeDto } from './dto/update-filmotheque.dto';
import { Filmotheque } from './entities/filmotheque.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from '../users/entities/user.entity';
import { MovieService } from '../Movie/movie.service';
import { Movie } from '../Movie/movie.entity';

@Injectable()
export class FilmothequeService {
  constructor(
    @InjectRepository(Filmotheque)
    public readonly filmothequeRepository: Repository<Filmotheque>,
    @InjectRepository(User)
    public readonly userRepository: Repository<User>,
    private readonly movieService: MovieService,
  ){}

  async create(createFilmothequeDto: CreateFilmothequeDto) {
    const existingFilmotheque = await this.filmothequeRepository.findOne({where: {
      nom: createFilmothequeDto.nom,
    },
  relations: ["users"]})
    if(existingFilmotheque){
      throw new ConflictException("This filmotheque already exist")
    }
    const newFilmotheque = this.filmothequeRepository.create({
      nom: createFilmothequeDto.nom,
      users: createFilmothequeDto.users
    })
    return this.filmothequeRepository.save(newFilmotheque);
  }

  findAll(users: User) {
    return this.filmothequeRepository.find({where: 
      {users: {
        id: users.id
      }},
      relations: ["users"]
    });
  }

  async listFilminFilmotheque(id: string): Promise<Movie[]> {
    const filmotheque = await this.filmothequeRepository.findOne({where: {id}});
    if (!filmotheque) {
      throw new NotFoundException("This filmotheque doesn't exist");
    }
    const movieIds = filmotheque.id_films;
    const movies = await Promise.all(movieIds.map(id => this.movieService.getMovie(id)));
    return movies;
  }
  

  async update(id: string, updateFilmothequeDto: UpdateFilmothequeDto) {
    const existingFilmotheque = await this.filmothequeRepository.findOne({
      where: { id },
      relations: ["users"]
    });
    if (!existingFilmotheque) {
      throw new NotFoundException("This filmotheque doesn't exist");
    }

    if (updateFilmothequeDto.nom) {
      existingFilmotheque.nom = updateFilmothequeDto.nom;
    }

    if (updateFilmothequeDto.id_films) {
      const currentIds = new Set(existingFilmotheque.id_films || []);
      updateFilmothequeDto.id_films.forEach(id => currentIds.add(id));
      existingFilmotheque.id_films = Array.from(currentIds);
  }
    if (updateFilmothequeDto.users && updateFilmothequeDto.users.length) {
      const newUserIds = updateFilmothequeDto.users.map(user => user.id);
      const existingUsersIds = existingFilmotheque.users.map(user => user.id);
      const newUsers = [];

      for (const userId of newUserIds) {
        if (!existingUsersIds.includes(userId)) {
          const newUser = await this.userRepository.findOne({where: {id: userId}});
          if (newUser) {
            newUsers.push(newUser);
          }
        }
      }

      existingFilmotheque.users = [...existingFilmotheque.users, ...newUsers];
    }

    await this.filmothequeRepository.save(existingFilmotheque);
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
    return filmotheque;
}

async removeFilmFromFilmotheque(id: string, filmIdsToRemove: string[]): Promise<Filmotheque> {
  const filmotheque = await this.filmothequeRepository.findOne({
    where: { id },
    relations: ["users"]
  });

  if (!filmotheque) {
    throw new NotFoundException("This filmotheque doesn't exist");
  }

  filmotheque.id_films = filmotheque.id_films.filter(id => !filmIdsToRemove.includes(id));

  await this.filmothequeRepository.save(filmotheque);
  return filmotheque;
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
