import { ProjectUserService } from './project-users.service';
import { ProjectUser } from './project-users.entity';
export declare class ProjectUserController {
    private readonly projectUserService;
    constructor(projectUserService: ProjectUserService);
    assignUserToProject(body: {
        startDate: Date;
        endDate: Date;
        userId: string;
        projectId: string;
    }): Promise<ProjectUser>;
}
