import { ProjectUser } from '../project-user/project-users.entity';
export declare class User {
    id: string;
    username: string;
    email: string;
    password: string;
    role: 'Employee' | 'Admin' | 'ProjectManager';
    projectUsers: ProjectUser[];
    createdAt: Date;
    updatedAt: Date;
}
