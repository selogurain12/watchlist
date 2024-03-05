import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

abstract class UserState {
  final LoginUserResponseEntity? login;
  final RegisterUserResponseEntity? register;
  final DioException? error;

  const UserState({
    this.error,
    this.login,
    this.register,
  });
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  const UserLoaded({LoginUserResponseEntity? login, RegisterUserResponseEntity? register}) : super(login: login, register: register);
}

class UserError extends UserState {
  final int? statusCode; // Include the status code in UserError
  const UserError({DioException? error, this.statusCode}) : super(error: error);

  // Getter for error message based on status code
  String get errorMessage {
    if (statusCode == 401) {
      return 'Unauthorized: Invalid credentials';
    } else if (statusCode == 404) {
      return 'Not Found: User not found';
    } else {
      return 'An error occurred';
    }
  }
}

class UserProvider with ChangeNotifier {
  String? userId;
  String? userPrenom;
  String? userNom;
  String? userMail;
  String? userUsername;

  void setUser({String? id, String? prenom, String? nom, String? mail, String? username}) {
    userId = id;
    userPrenom = prenom;
    userNom = nom;
    userMail = mail;
    userUsername = username;
    notifyListeners();
  }
}

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}