"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProjectUserService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const project_users_entity_1 = require("./project-users.entity");
const projects_entity_1 = require("../project/projects.entity");
const user_entity_1 = require("../user/user.entity");
let ProjectUserService = class ProjectUserService {
    constructor(projectUserRepository, projectRepository, userRepository) {
        this.projectUserRepository = projectUserRepository;
        this.projectRepository = projectRepository;
        this.userRepository = userRepository;
    }
    async assignUserToProject(startDate, endDate, userId, projectId) {
        const user = await this.userRepository.findOne({ where: { id: userId } });
        if (!user || !this.isUserAuthorized(user)) {
            throw new common_1.UnauthorizedException();
        }
        const project = await this.projectRepository.findOne({ where: { id: projectId } });
        if (!project) {
            throw new Error('Project not found');
        }
        const conflictingAssignments = await this.projectUserRepository.find({
            where: {
                userId,
                startDate: (0, typeorm_2.LessThanOrEqual)(endDate),
                endDate: (0, typeorm_2.MoreThanOrEqual)(startDate),
            },
        });
        if (conflictingAssignments.length > 0) {
            throw new common_1.ConflictException('Employee is already assigned to another project for the specified period');
        }
        const newProjectUser = this.projectUserRepository.create({
            startDate,
            endDate,
            userId,
            projectId,
            project,
            user,
        });
        return await this.projectUserRepository.save(newProjectUser);
    }
    isUserAuthorized(user) {
        return user.role.includes('Admin') || user.role.includes('ProjectManager');
    }
};
exports.ProjectUserService = ProjectUserService;
exports.ProjectUserService = ProjectUserService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(project_users_entity_1.ProjectUser)),
    __param(1, (0, typeorm_1.InjectRepository)(projects_entity_1.Project)),
    __param(2, (0, typeorm_1.InjectRepository)(user_entity_1.User)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository])
], ProjectUserService);
//# sourceMappingURL=project-users.service.js.map