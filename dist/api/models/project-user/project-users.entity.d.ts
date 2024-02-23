import { Project } from '../project/projects.entity';
import { User } from '../user/user.entity';
export declare class ProjectUser {
    id: string;
    projectId: string;
    userId: string;
    project: Project;
    user: User;
    startDate: Date;
    endDate: Date;
    createdAt: Date;
    updatedAt: Date;
}
