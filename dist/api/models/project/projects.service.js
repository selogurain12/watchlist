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
exports.ProjectService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const projects_entity_1 = require("./projects.entity");
const user_entity_1 = require("../user/user.entity");
let ProjectService = class ProjectService {
    constructor(projectRepository, userRepository) {
        this.projectRepository = projectRepository;
        this.userRepository = userRepository;
    }
    async createProject(name, referringEmployeeId) {
        const referringEmployee = await this.userRepository.findOne({
            where: {
                id: referringEmployeeId,
            },
        });
        if (!referringEmployee || !this.isUserAuthorized(referringEmployee)) {
            throw new common_1.UnauthorizedException();
        }
        if (name.length < 3) {
            throw new common_1.BadRequestException('Project name must contain at least 3 characters');
        }
        const newProject = this.projectRepository.create({
            name,
            referringEmployee
        });
        const savedProject = await this.projectRepository.save(newProject);
        return { project: savedProject, referringEmployee };
    }
    isUserAuthorized(user) {
        return user.role.includes('Admin') || user.role.includes('ProjectManager');
    }
};
exports.ProjectService = ProjectService;
exports.ProjectService = ProjectService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(projects_entity_1.Project)),
    __param(1, (0, typeorm_1.InjectRepository)(user_entity_1.User)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], ProjectService);
//# sourceMappingURL=projects.service.js.map