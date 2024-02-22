export declare class CreateUserDto {
    id: string;
    username: string;
    password: string;
    email: string;
    role: 'Employee' | 'Admin' | 'ProjectManager';
}
