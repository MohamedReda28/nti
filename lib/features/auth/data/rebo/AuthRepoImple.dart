import 'package:dartz/dartz.dart';
import 'package:nti_app/core/errors/CustomException.dart';
import 'package:nti_app/core/errors/Failur.dart';
import 'package:nti_app/core/serveces/firebase_auth.dart';
import 'package:nti_app/features/auth/data/models/userModel.dart';
import 'package:nti_app/features/auth/domin/entites/user_Entity.dart';
import 'package:nti_app/features/auth/domin/repo/AuthRebo.dart';

class AuthRepoImpli  extends AuthRepo {
   FireBaseAuthServece fireBaseAuthServece;

  AuthRepoImpli(this. fireBaseAuthServece);
  @override
  Future<Either<Failur, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await fireBaseAuthServece.createUserWithEmailAndPassword(
          email: email, password: password);
      Usermodel usermodel = Usermodel.fromfirebaseuser(user);
      // UserEntity userEntity =
      //     UserEntity(name: name, email: email, uId: user.uid);
      UserEntity userEntity = usermodel.toEntity();



      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailur(errMassege: e.message));
    }
  }


}
