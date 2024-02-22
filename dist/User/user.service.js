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
exports.UserService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const user_entity_1 = require("./user.entity");
let UserService = class UserService {
    constructor(userRepository, statsRepository) {
        this.userRepository = userRepository;
        this.statsRepository = statsRepository;
    }
    async register(user) {
        try {
            const newUser = this.userRepository.create(user);
            const userlog = await this.userRepository.save(newUser);
            return { user: userlog, status: "utilisateur inscrit" };
        }
        catch (error) {
            if (error instanceof typeorm_2.QueryFailedError && error.message.includes('duplicate key')) {
                throw new common_1.ConflictException('User with the same email already exists.');
            }
            throw error;
        }
    }
    async login(mail, mdp) {
        const user = await this.userRepository.findOne({ where: { mail } });
        if (!user) {
            throw new common_1.NotFoundException('User not found');
        }
        if (user.mdp !== mdp) {
            throw new common_1.UnauthorizedException('Invalid credentials');
        }
        return { user: user, status: "Utilisateur connecté" };
    }
    async me(id) {
        const user = await this.userRepository.findOne({ where: { id } });
        if (!user) {
            throw new common_1.NotFoundException('User not found');
        }
        return user;
    }
    async search(id) {
        const user = await this.userRepository.findOne({ where: { id } });
        if (!user) {
            throw new common_1.NotFoundException('User not found');
        }
        return user;
    }
    async findAll() {
        return await this.userRepository.find();
    }
    async stats(id) {
        const user = await this.userRepository.findOne({ where: { id } });
        if (!user) {
            throw new common_1.NotFoundException('User not found');
        }
        const stats = await this.statsRepository.findOne({ where: { iduser: id } });
        return { user: user, stats: stats };
    }
};
exports.UserService = UserService;
exports.UserService = UserService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(user_entity_1.User)),
    __param(1, (0, typeorm_1.InjectRepository)(user_entity_1.statsuser)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], UserService);
//# sourceMappingURL=user.service.js.map