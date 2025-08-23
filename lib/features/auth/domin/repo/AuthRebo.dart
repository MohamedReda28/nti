import 'package:dartz/dartz.dart';
import 'package:nti_app/core/errors/Failur.dart';
import 'package:nti_app/features/auth/domin/entites/user_Entity.dart';

abstract class AuthRepo{

 Future<Either<Failur,UserEntity>> createUserWithEmailAndPassword({required String email,required String password,required String name});


} 
  


