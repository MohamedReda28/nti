import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_app/core/serveces/gitit.dart';
import 'package:nti_app/core/widgets/BuildSnakBar.dart';
import 'package:nti_app/core/widgets/CustomProgressHUD.dart';
import 'package:nti_app/core/widgets/buildAppBar.dart';
import 'package:nti_app/features/auth/domin/repo/AuthRebo.dart';
import 'package:nti_app/features/auth/presentstion/cubits/siginin/signin_cubit_cubit.dart';
import 'package:nti_app/features/auth/presentstion/views/widgets/SiginViewBoby.dart';

import '../../../Home/peresntation/views/mainView.dart';

class SiginView extends StatelessWidget {
  const SiginView({super.key});
  static const routeName = 'SiginView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: const SiginVeiwBodyBlocConsumer(),
      ),
    );
  }
}

class SiginVeiwBodyBlocConsumer extends StatelessWidget {
  const SiginVeiwBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninCubitState>(
      listener: (context, state) {
        if (state is SigninCubitSuccess) {
          BuildSnakBar(context, 'تم تسجيل الدخول');
          Navigator.pushNamed(context, MainView.routeName);
        }
        if (state is SigninCubitFaluir) {
          BuildSnakBar(context, state.errMassege);
        }
      },
      builder: (context, state) {
        return CustoProgressHUD(
          isLoading: state is SigninCubitLoading,
          child: const SiginVeiwBody(),
        );
      },
    );
  }
}
