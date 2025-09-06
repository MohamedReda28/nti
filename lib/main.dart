import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nti_app/core/helpFunction/onGenrateRoute.dart';
import 'package:nti_app/core/serveces/gitit.dart';
import 'package:nti_app/generated/l10n.dart';
import 'core/serveces/CustomBlocObserver.dart';
import 'core/serveces/shardpreferance_Singlton.dart';
import 'core/uitels/App_Color.dart';
import 'features/Home/peresntation/views/mainView.dart';
import 'features/auth/presentstion/views/signinView.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  await SharPref.init();

  gititsetup();

  runApp(const NtiApp());
}

class NtiApp extends StatelessWidget {
  const NtiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimaryColor)),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      onGenerateRoute: onGenrateRoute,
      home:  const SiginView(),
    );
  }
}
