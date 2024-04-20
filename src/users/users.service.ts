import { ConflictException, Injectable, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { Repository } from 'typeorm';
import { LoginUserDto } from './dto/login-user.dto';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    public readonly userRepository: Repository<User>,
  ){}

  async create(createUserDto: CreateUserDto) {
    const existingUser = await this.userRepository.findOne({
      where: {
        nom: createUserDto.nom,
        prenom: createUserDto.prenom,
        mail: createUserDto.mail,
        username: createUserDto.username,
        mdp: createUserDto.mdp,
    }})
    if(existingUser){
      throw new ConflictException('This user already exist')
    }
    const existingUsername = await this.userRepository.findOne({
      where: { username: createUserDto.username },
    });
    const existingMail = await this.userRepository.findOne({
      where: { mail: createUserDto  .mail },
    });
    if(existingUsername){
      throw new ConflictException('User with the same username already exists.');
    }
    if(existingMail){
      throw new ConflictException('User with the same email already exists.');
    }
    const newUser = this.userRepository.create(createUserDto);
    const user = this.userRepository.save(newUser)
    delete (await user).mdp;
    return user;
  }

  async login(loginUserDto: LoginUserDto) {
    const existingUser = await this.userRepository.findOne({
      where: {
        username: loginUserDto.username
    },
    select: ['id', 'username', 'mdp', 'nom', 'prenom', 'mail']})
    if(!existingUser){
      throw new NotFoundException('This user dosen\'t exist')
    }
    if(loginUserDto.mdp !== existingUser.mdp){
      throw new UnauthorizedException('Invalid credential')
    }
    delete existingUser.mdp;
    return existingUser;
  }

  async findOne(id: string) {
    const findUser = await this.userRepository.findOne({where: {id}})
    return findUser;
  }

  async update(id: string, updateUserDto: UpdateUserDto) {
    const findUser = await this.userRepository.findOne({where: {id}})
    if(!findUser){
      throw new NotFoundException("User not found")
    }
    const updatedUser = this.userRepository.merge(
      findUser,
      updateUserDto,
    );
    const saveUser =
      await this.userRepository.save(updatedUser);
    return saveUser;
  }

  async remove(id: string) {
    const user = await this.userRepository.findOne({
      where: {id}
    });
    if (!user) {
      throw new NotFoundException("This user dosen't exist");
    }
    this.userRepository.delete(user.id);
    return `This action removes a #${id} user`;
  }
}
