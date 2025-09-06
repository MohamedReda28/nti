import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nti_app/core/serveces/ApiServese.dart';
import 'package:nti_app/core/serveces/FireStoreServece.dart';
import 'package:nti_app/core/serveces/dataBaseServece.dart';
import 'package:nti_app/core/serveces/firebase_auth.dart';
import 'package:nti_app/features/Home/data/repoImpl/product_repo_impl.dart';
import 'package:nti_app/features/Home/domines/repo/product_repo.dart';
import 'package:nti_app/features/auth/data/rebo/AuthRepoImple.dart';
import 'package:nti_app/features/auth/domin/repo/AuthRebo.dart';

final getIt = GetIt.instance;

void gititsetup() {
  getIt.registerSingleton<FireBaseAuthServece>(FireBaseAuthServece());
  getIt.registerSingleton<DataBaseServese>(Firestoreservece());
  getIt.registerSingleton<ApiServese>(ApiServese(Dio()));

  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(
      apiServese: getIt<ApiServese>()));


  getIt.registerSingleton<AuthRepo>(AuthRepoImpli(
    getIt<FireBaseAuthServece>(),
    getIt<DataBaseServese>(),
  ));
}
