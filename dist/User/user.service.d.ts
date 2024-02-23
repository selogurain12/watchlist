import { Repository } from 'typeorm';
import { statsuser, User } from './user.entity';
export declare class UserService {
    private readonly userRepository;
    private readonly statsRepository;
    constructor(userRepository: Repository<User>, statsRepository: Repository<statsuser>);
    register(user: User): Promise<{
        user: User;
        status: string;
    }>;
    login(mail: any, mdp: any): Promise<{
        user: User;
        status: string;
    }>;
    me(id: number): Promise<User>;
    search(id: number): Promise<User>;
    findAll(): Promise<User[]>;
    stats(id: number): Promise<{
        user: User;
        stats: statsuser;
    }>;
}
