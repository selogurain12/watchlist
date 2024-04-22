import { Body, ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateFriendslistDto } from './dto/create-friendslist.dto';
import { UpdateFriendslistDto } from './dto/update-friendslist.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Friendslist } from './entities/friendslist.entity';
import { Repository } from 'typeorm';
import { User } from '../users/entities/user.entity';

@Injectable()
export class FriendslistService {
  constructor(
    @InjectRepository(Friendslist)
    public readonly friendslistRepository: Repository<Friendslist>,
    @InjectRepository(User)
    public readonly userRepository: Repository<User>,
  ){}
  
  async create(createFriendslistDto: CreateFriendslistDto) {
    const user = await this.userRepository.findOneBy({ id: createFriendslistDto.user.id });
    if (!user) {
      throw new NotFoundException('User not found');
    }
    const newFriend = this.friendslistRepository.create({
      user: user,
      friends: createFriendslistDto.friends
    });

    return this.friendslistRepository.save(newFriend);
  }

  async findAll(user: User) {
    const friends = await this.friendslistRepository.find({where: {
      user: {
        id: user.id
      }
    }, relations: ['friends']})
    return friends;
  }

  async update(id: string, updateFriendslistDto: UpdateFriendslistDto) {
    const existingList = await this.friendslistRepository.findOne({
      where: { user: {id} },
      relations: ['friends']
    });
    if (!existingList) {
      throw new NotFoundException('This user does not exist');
    }
    if (!existingList.friends) {
      existingList.friends = [];
    }
    const newFriendsIds = updateFriendslistDto.friends.map(friend => friend.id);
    const existingFriendsIds = existingList.friends.map(friend => friend.id);
    for (const friendId of newFriendsIds) {
      if (!existingFriendsIds.includes(friendId)) {
        const newFriend = await this.userRepository.findOne({ where: { id: friendId } });
        if (newFriend) {
          existingList.friends.push(newFriend);
        }
      }
    }
    await this.friendslistRepository.save(existingList);
    return existingList;
  }
  

  async remove(id: string) {
    const friendsLists = await this.friendslistRepository.find({ relations: ['friends'] });
    for (const friendsList of friendsLists) {
      const friendToRemove = friendsList.friends.find(friend => friend.id === id);
      if (friendToRemove) {
        friendsList.friends = friendsList.friends.filter(friend => friend.id !== id);
        await this.friendslistRepository.save(friendsList);
        return `Friend with ID ${id} has been removed`;
      }
    }
    throw new NotFoundException(`Friend with ID ${id} not found in any friends list`);
  }
  
}
