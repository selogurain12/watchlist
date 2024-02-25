import { ConflictException, Injectable, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, QueryFailedError } from 'typeorm';
import { LoginDto, User } from './user.entity';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}

  async register(user: User): Promise<User> {
    try {
      const newUser = this.userRepository.create(user);
      return await this.userRepository.save(newUser);
    } catch (error) {
      if (error instanceof QueryFailedError && error.message.includes('duplicate key')) {
        throw new ConflictException('User with the same email already exists.');
      }
      throw error;
    }
  }

  async login(login: LoginDto): Promise<User> {
    const utilisateur = await this.userRepository.findOne({ where: { mail: login.mail } });

    if (!utilisateur) {
      throw new NotFoundException('User not found');
    }

    if (login.mdp !== utilisateur.mdp) {
      throw new UnauthorizedException('Invalid credentials');
    }

    return utilisateur;
  }

  async findAll(): Promise<User[]> {
    return await this.userRepository.find();
  }
}