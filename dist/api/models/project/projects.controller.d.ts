import { ProjectService } from './projects.service';
import { Project } from './projects.entity';
import { User } from '../user/user.entity';
export declare class ProjectController {
    private readonly projectService;
    constructor(projectService: ProjectService);
    createProject(body: any): Promise<{
        project: Project;
        referringEmployee: User;
    }>;
}
