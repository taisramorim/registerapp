import 'dart:developer';

import 'package:registerapp/models/user/user_model.dart';
import 'package:registerapp/models/user/user_model_entity.dart';
import 'package:registerapp/repositories/user/user_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
 
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser){
      final user = firebaseUser; 
      return user;
    });
  }

  @override
  UserModel? get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser == null ? null : UserModel.fromEntity(firebaseUser as UserModelEntity);
  }

  @override
  Future<UserModel> getUser(String userModelId) async {
    try {
      return usersCollection.doc(userModelId).get().then((value) =>
        UserModel.fromEntity(UserModelEntity.fromDocument(value.data()!))
      );
    } catch (e) {
      log(e.toString());

      
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(UserModel userModel, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email!, 
        password: password
        );
        userModel = userModel.copyWith(
          id: user.user!.uid,        
          );
          return userModel;
    } catch (e) {
      log(e.toString());
      rethrow;
      }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
        );
    } catch (e) {
      log(e.toString());
      rethrow;
      }
    }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
      }
  }
  
  @override
  Future<void> setUser(UserModel user) async {
    try {
      await usersCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}