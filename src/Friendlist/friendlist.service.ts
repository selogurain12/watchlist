import { ConflictException, Injectable, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Friendlist, userfriendDto, userprincipalDto } from './friendlist.entity';
import { User } from '../user/user.entity';
import { UserService } from '../user/user.service';

@Injectable()
export class FriendlistService {
  constructor(
    @InjectRepository(Friendlist)
    private readonly friendlistRepository: Repository<Friendlist>,
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}

  async addfriend(friend: Friendlist): Promise<Friendlist> {
    const existingFriend = await this.friendlistRepository.findOne({
      where: { 
        userprincipal: friend.userprincipal, 
        user2: friend.user2 
        },
    });
    const existingUser = await this.userRepository.findOne({
        where: {
            username: friend.userprincipal,
        }
    })
    const existingFriend2 = await this.userRepository.findOne({
        where: {
            username: friend.user2,
        }
    })
    if(existingFriend){
      throw new ConflictException('The friend is already add');
    }
    if(!existingFriend2){
        throw new NotFoundException('This user dosen\'t exist');
      }
    if(!existingUser){
        throw new NotFoundException('This user dosen\'t exist');
      }
      const newFriend = this.friendlistRepository.create(friend);
      const saveFriend = await this.friendlistRepository.save(newFriend);
      return saveFriend
  }

  async listfriend(userprincipal: userprincipalDto): Promise<Friendlist[]> {
    const existingUser = await this.userRepository.findOne({
        where: {
            username: userprincipal.userprincipal,
        }
    })
    if(!existingUser){
        throw new NotFoundException('This user dosen\'t exist');
      }
    const friendlist = await this.friendlistRepository.find({ where: { userprincipal: userprincipal.userprincipal } });
    return friendlist;
  }

  async searchfriend(userfriend: userfriendDto): Promise<Friendlist> {
    const friend = await this.friendlistRepository.findOne({ where:{
        userprincipal: userfriend.userprincipal,
        user2: userfriend.user2 
      }});
    return friend
  }
}