import 'package:firebase_auth/firebase_auth.dart';
import 'package:nti_app/features/auth/domin/entites/user_Entity.dart';

class Usermodel {
  final String name;
  final String email;
  final String uId;

  Usermodel({required this.name, required this.email, required this.uId});

  factory Usermodel.fromfirebaseuser(User user){
    return Usermodel(name: user.displayName??'', email: user.email??'', uId: user.uid);
  }

  UserEntity toEntity(){
    return UserEntity(email: email, name:name , uId:uId ,);
  }
  
}