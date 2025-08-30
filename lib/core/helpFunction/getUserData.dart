import 'dart:convert';
import 'package:nti_app/core/uitels/BackEndEndpoid.dart';
import 'package:nti_app/features/auth/data/models/userModel.dart';
import 'package:nti_app/features/auth/domin/entites/user_Entity.dart';

import '../serveces/shardpreferance_Singlton.dart';


UserEntity getUser(){

  var jsonString = SharPref.getString(BackEndEndPoint.getUserDataformLocal);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString)).toEntity();
  return userEntity;
}