import { Repository } from 'typeorm';
import { User } from './user.entity';
import { JwtService } from '@nestjs/jwt';
export declare class UsersService {
    private userRepository;
    private jwtService;
    constructor(userRepository: Repository<User>, jwtService: JwtService);
    createUser(user: User): Promise<{
        id: string;
        username: string;
        email: string;
        role: 'Employee' | 'Admin' | 'ProjectManager';
    }>;
    authenticateUser(email: string, password: string): Promise<string>;
    getAuthenticatedUser(token: string): Promise<User | undefined>;
    findOneById(id: string): Promise<{
        id: string;
        username: string;
        email: string;
        role: 'Employee' | 'Admin' | 'ProjectManager';
    } | undefined>;
    getAllUsers(): Promise<User[]>;
    getOneUsers(id: string): Promise<User | undefined>;
}
