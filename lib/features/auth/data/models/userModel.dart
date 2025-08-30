import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:nti_app/features/auth/domin/entites/user_Entity.dart';

class   UserModel {
  final String name;
  final String email;
  final String uId;

  UserModel({required this.name, required this.email, required this.uId});

  factory UserModel.fromfirebaseuser(User user){
    return UserModel(name: user.displayName??'', email: user.email??'', uId: user.uid);
  }

  factory UserModel.FromEntity(UserEntity user){
    return UserModel(name: user.name, email: user.email, uId: user.uId);
  }

  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      name: json['name'], 
      email: json['email'], 
      uId: json['uId']
      );

  }




  UserEntity toEntity(){
    return UserEntity(email: email, name:name , uId:uId ,);
  }
  

  toJson(){
    return {
      'name':name,
      'email':email,
      'uId': uId,
    };
  }
}