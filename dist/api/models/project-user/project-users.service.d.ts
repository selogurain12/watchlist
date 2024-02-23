import { Repository } from 'typeorm';
import { ProjectUser } from './project-users.entity';
import { Project } from '../project/projects.entity';
import { User } from '../user/user.entity';
export declare class ProjectUserService {
    private readonly projectUserRepository;
    private readonly projectRepository;
    private readonly userRepository;
    constructor(projectUserRepository: Repository<ProjectUser>, projectRepository: Repository<Project>, userRepository: Repository<User>);
    assignUserToProject(startDate: Date, endDate: Date, userId: string, projectId: string): Promise<ProjectUser>;
    private isUserAuthorized;
}
