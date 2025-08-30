import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:nti_app/features/auth/domin/entites/user_Entity.dart';
import 'package:nti_app/features/auth/domin/repo/AuthRebo.dart';
part 'signin_cubit_state.dart';

class SigninCubit extends Cubit<SigninCubitState> {
  SigninCubit(this.authRepo) : super(SigninCubitInitial());

  AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SigninCubitLoading());
    var result = await authRepo.signinUserWithEmailAndPassword(
        email: email, password: password);
    result.fold((faluir) => emit(SigninCubitFaluir(faluir.errMassege)),
        (userEntity) => emit(SigninCubitSuccess(userEntity)));
  }
}
