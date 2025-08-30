import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nti_app/core/errors/CustomException.dart';

class FireBaseAuthServece {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Excaption  in CreateUserWithEmailAndPassword. ${e.toString()}');

      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمه المرور ضعيفه');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'الايميل موجود');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'قم بالاتصال بالانترنت');
      } else {
        throw CustomException(message: 'حدث خطأ حاول لاحقا');
      }
    } catch (e) {
      log('Excaption  in CreateUserWithEmailAndPassword. ${e.toString()}');

      throw CustomException(message: 'حدث خطأ حاول لاحقا');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Excaption  in SignInWithEmailAndPassword. ${e.toString()}code = ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'البريد الاليكتروني او كلمه المرور غير صحيحة');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'البريد الاليكتروني او كلمه المرور غير صحيحة');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'البريد الاليكتروني او كلمه المرور غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'قم بالاتصال بالانترنت');
      } else {
        log('Excaption  in SignInWithEmailAndPassword. ${e.toString()} code = ${e.code}');

        throw CustomException(message: 'حدث خطأ,حاول لاحقا ');
      }
    } catch (e) {
      log('Excaption  in SignInWithEmailAndPassword. ${e.toString()}');
      throw CustomException(message: 'حدث خطأ,حاول لاحقا');
    }
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
