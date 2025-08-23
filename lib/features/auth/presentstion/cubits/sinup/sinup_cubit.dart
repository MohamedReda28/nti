import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_app/features/auth/domin/entites/user_Entity.dart';
import 'package:nti_app/features/auth/domin/repo/AuthRebo.dart';

part 'sinup_state.dart';

class SinupCubit extends Cubit<SinupState> {
  SinupCubit(this.authRepo) : super(SinupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({required String name,required String email, required String password}) async{

    emit(SinupLoading());
    var result = await authRepo.createUserWithEmailAndPassword(email: email, password: password, name: name);
    result.fold(
      (faluir)=>emit(SinupFauiler(faluir.errMassege))
    , 
    (UserEntity)=>emit(SinupSussecc(UserEntity))
    );
  }

}
