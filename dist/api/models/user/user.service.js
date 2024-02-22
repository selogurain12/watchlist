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
exports.UsersService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("typeorm");
const typeorm_2 = require("@nestjs/typeorm");
const user_entity_1 = require("./user.entity");
const bcrypt = require("bcrypt");
const jwt_1 = require("@nestjs/jwt");
let UsersService = class UsersService {
    constructor(userRepository, jwtService) {
        this.userRepository = userRepository;
        this.jwtService = jwtService;
    }
    async createUser(user) {
        if (user.password.length < 8) {
            throw new common_1.BadRequestException('Le mot de passe doit avoir au moins 8 caractères.');
        }
        if (!user.username || user.username.length < 3) {
            throw new common_1.BadRequestException('username should not be empty');
        }
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(user.email)) {
            throw new common_1.BadRequestException('email must be an email');
        }
        const existingUser = await this.userRepository.findOne({ where: { email: user.email } });
        if (existingUser) {
            throw new Error('L\'adresse e-mail est déjà utilisée.');
        }
        const existingUsername = await this.userRepository.findOne({ where: { username: user.username } });
        if (existingUsername) {
            throw new Error('L\'username est déjà utilisée.');
        }
        user.password = await bcrypt.hash(user.password, 10);
        const createdUser = await this.userRepository.save(user);
        return {
            id: createdUser.id,
            username: createdUser.username,
            email: createdUser.email,
            role: createdUser.role,
        };
    }
    async authenticateUser(email, password) {
        const user = await this.userRepository.findOne({ where: { email } });
        if (!user) {
            throw new common_1.UnauthorizedException('L\'utilisateur n\'existe pas.');
        }
        const passwordMatch = await bcrypt.compare(password, user.password);
        if (!passwordMatch) {
            throw new common_1.UnauthorizedException('Mot de passe incorrect.');
        }
        const token = await this.jwtService.signAsync({ sub: user.id, email: user.email });
        return token;
    }
    async getAuthenticatedUser(token) {
        try {
            const payload = await this.jwtService.verifyAsync(token, { secret: 'secretKey' });
            return this.userRepository.findOne({ where: { id: payload.sub } });
        }
        catch (error) {
            return undefined;
        }
    }
    async findOneById(id) {
        return this.userRepository.findOne({ where: { id } });
    }
    async getAllUsers() {
        const users = await this.userRepository.find();
        return users.map((user) => {
            delete user.password;
            return user;
        });
    }
    async getOneUsers(id) {
        const uuidv4Regex = /^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;
        if (!uuidv4Regex.test(id)) {
            throw new common_1.BadRequestException('Invalid UUIDv4 format for user ID.');
        }
        return this.userRepository.findOne({ where: { id } });
    }
};
exports.UsersService = UsersService;
exports.UsersService = UsersService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_2.InjectRepository)(user_entity_1.User)),
    __metadata("design:paramtypes", [typeorm_1.Repository,
        jwt_1.JwtService])
], UsersService);
//# sourceMappingURL=user.service.js.map