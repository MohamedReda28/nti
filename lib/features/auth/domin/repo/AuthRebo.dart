import 'package:dartz/dartz.dart';
import 'package:nti_app/core/errors/Failur.dart';
import 'package:nti_app/features/auth/domin/entites/user_Entity.dart';

abstract class AuthRepo {
  Future<Either<Failur, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});

  Future<Either<Failur, UserEntity>> signinUserWithEmailAndPassword(
      {required String email, required String password});
  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uID});
  Future saveUserData({required UserEntity user});
}
