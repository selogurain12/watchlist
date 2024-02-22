import { User } from '../user/user.entity';
import { ProjectUser } from '../project-user/project-users.entity';
export declare class Project {
    id: string;
    name: string;
    referringEmployeeId: string;
    referringEmployee: User;
    projectUsers: ProjectUser[];
    createdAt: Date;
    updatedAt: Date;
}
