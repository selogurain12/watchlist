"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProjectModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const project_users_entity_1 = require("./project-users.entity");
const jwt_1 = require("@nestjs/jwt");
const project_users_controller_1 = require("./project-users.controller");
const project_users_service_1 = require("./project-users.service");
const user_entity_1 = require("../user/user.entity");
const projects_entity_1 = require("../project/projects.entity");
const constant_1 = require("../auth/constant");
let ProjectModule = class ProjectModule {
};
exports.ProjectModule = ProjectModule;
exports.ProjectModule = ProjectModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([project_users_entity_1.ProjectUser, user_entity_1.User, projects_entity_1.Project]),
            jwt_1.JwtModule.register({
                global: true,
                secret: constant_1.jwtConstants.secret,
                signOptions: { expiresIn: '12h' }
            })
        ],
        controllers: [project_users_controller_1.ProjectUserController],
        providers: [project_users_service_1.ProjectUserService],
    })
], ProjectModule);
//# sourceMappingURL=project-users.module.js.map