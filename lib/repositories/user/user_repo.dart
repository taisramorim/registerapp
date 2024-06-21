import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user/user_model.dart';

abstract class UserRepository {

  Stream<User?> get user;

  UserModel? get currentUser;

  Future<UserModel> getUser(String userModelId);

  Future<void> setUser(UserModel user);

  Future<UserModel> signUp(UserModel userModel, String password);

  Future<void> signIn(String email, String password);

  Future<void> signOut();
}