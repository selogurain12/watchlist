"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Projects = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const projects_entity_1 = require("./projects.entity");
const jwt_1 = require("@nestjs/jwt");
const projects_controller_1 = require("./projects.controller");
const projects_service_1 = require("./projects.service");
const user_entity_1 = require("../user/user.entity");
const constant_1 = require("../auth/constant");
let Projects = class Projects {
};
exports.Projects = Projects;
exports.Projects = Projects = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([projects_entity_1.Project, user_entity_1.User]),
            jwt_1.JwtModule.register({
                global: true,
                secret: constant_1.jwtConstants.secret,
                signOptions: { expiresIn: '12h' }
            })
        ],
        providers: [projects_service_1.ProjectService],
        controllers: [projects_controller_1.ProjectController],
    })
], Projects);
//# sourceMappingURL=projects.module.js.map