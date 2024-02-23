import { UsersService } from './user.service';
import { User } from './user.entity';
import { JwtService } from '@nestjs/jwt';
export declare class AuthController {
    private readonly usersService;
    private readonly jwtService;
    constructor(usersService: UsersService, jwtService: JwtService);
    signUp(user: User): Promise<{
        id: string;
        username: string;
        email: string;
        role: 'Employee' | 'Admin' | 'ProjectManager';
    }>;
    login(credentials: {
        email: string;
        password: string;
    }): Promise<{
        access_token: string;
    }>;
    getProfile(req: any): Promise<{
        id: string;
        username: string;
        email: string;
        role: 'Employee' | 'Admin' | 'ProjectManager';
    }>;
    getUsers(): Promise<User[]>;
    getUserById(id: string): Promise<User>;
}
