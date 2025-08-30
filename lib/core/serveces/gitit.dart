import 'package:get_it/get_it.dart';
import 'package:nti_app/core/serveces/FireStoreServece.dart';
import 'package:nti_app/core/serveces/dataBaseServece.dart';
import 'package:nti_app/core/serveces/firebase_auth.dart';
import 'package:nti_app/features/auth/data/rebo/AuthRepoImple.dart';
import 'package:nti_app/features/auth/domin/repo/AuthRebo.dart';

final getIt = GetIt.instance;

void gititsetup() {
  getIt.registerSingleton<FireBaseAuthServece>(FireBaseAuthServece());
  getIt.registerSingleton<DataBaseServese>(Firestoreservece());

  getIt.registerSingleton<AuthRepo>(AuthRepoImpli(
    getIt<FireBaseAuthServece>(),
    getIt<DataBaseServese>(),
  ));
}
