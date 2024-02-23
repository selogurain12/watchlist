import { Repository } from 'typeorm';
import { Project } from './projects.entity';
import { User } from '../user/user.entity';
export declare class ProjectService {
    private readonly projectRepository;
    private readonly userRepository;
    constructor(projectRepository: Repository<Project>, userRepository: Repository<User>);
    createProject(name: string, referringEmployeeId: string): Promise<{
        project: Project;
        referringEmployee: User;
    }>;
    private isUserAuthorized;
}
