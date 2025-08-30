import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nti_app/core/errors/CustomException.dart';
import 'package:nti_app/core/errors/Failur.dart';
import 'package:nti_app/core/serveces/dataBaseServece.dart';
import 'package:nti_app/core/serveces/firebase_auth.dart';
import 'package:nti_app/core/uitels/BackEndEndpoid.dart';
import 'package:nti_app/features/auth/data/models/userModel.dart';
import 'package:nti_app/features/auth/domin/entites/user_Entity.dart';
import 'package:nti_app/features/auth/domin/repo/AuthRebo.dart';

import '../../../../core/serveces/shardpreferance_Singlton.dart';

class AuthRepoImpli extends AuthRepo {
  FireBaseAuthServece fireBaseAuthServece;
  DataBaseServese dataBaseServese;

  AuthRepoImpli(this.fireBaseAuthServece, this.dataBaseServese);
  @override
  Future<Either<Failur, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await fireBaseAuthServece.createUserWithEmailAndPassword(
          email: email, password: password);
      // UserModel usermodel = UserModel.fromfirebaseuser(user);
      UserEntity userEntity =
          UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        fireBaseAuthServece.deleteUser();
      }
      return left(ServerFailur(errMassege: e.message));
    } catch (e) {
      if (user != null) {
        fireBaseAuthServece.deleteUser();
      }

      log('Exsiption in createUserWithEmailAndPassword ${e.toString()}');
      return left(ServerFailur(errMassege: e.toString()));
    }
  }

  @override
  Future<Either<Failur, UserEntity>> signinUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      User user = await fireBaseAuthServece.signInWithEmailAndPassword(
          email: email, password: password);
      // UserModel userModel = UserModel.fromfirebaseuser(user);
      // UserEntity userEntity = userModel.toEntity();
      var userEntity =await getUserData(uID:user.uid );
      saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailur(errMassege: e.message));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await dataBaseServese.addData(
      path: BackEndEndPoint.addUserData,
      data: UserModel.FromEntity(user).toJson(),
      docId: user.uId,
    );
  }
  
  @override
  Future<UserEntity> getUserData({required String uID})async{
   var data=await dataBaseServese.getData(
    path: BackEndEndPoint.getUserData,
    docId: uID,
    )as Map<String,dynamic>;
   UserModel userModel= UserModel.fromJson(data);
   UserEntity userEntity = userModel.toEntity();
   return userEntity;

  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.FromEntity(user).toJson());
    await SharPref.setString(BackEndEndPoint.addUserDataformLocal, jsonData);

  }

}
