import { UserService } from './user.service';
import { LoginDto, statsuser, User } from './user.entity';
export declare class UserController {
    private readonly userService;
    constructor(userService: UserService);
    register(user: User): Promise<{
        user: User;
        status: string;
    }>;
    login(login: LoginDto): Promise<{
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
