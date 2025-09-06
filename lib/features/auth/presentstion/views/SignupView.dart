import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nti_app/core/helpFunction/BuildSnakBar.dart';
import 'package:nti_app/core/serveces/gitit.dart';
import 'package:nti_app/core/widgets/buildAppBar.dart';
import 'package:nti_app/features/auth/domin/repo/AuthRebo.dart';
import 'package:nti_app/features/auth/presentstion/cubits/sinup/sinup_cubit.dart';
import 'package:nti_app/features/auth/presentstion/views/widgets/SignupViewBody.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'SignUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SinupCubit(getIt<AuthRepo>()),
        child: Scaffold(
            appBar: buildAppBar(context, title: 'حساب جديد'),
            body: SigupViewBodtBlocConsumer()));
  }
}

class SigupViewBodtBlocConsumer extends StatelessWidget {
  const SigupViewBodtBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SinupCubit, SinupState>(
      listener: (context, state) {
        if (state is SinupSussecc) {
          BuildSnakBar(context, 'تم انشاء حساب بنجاح');
        }
        if (state is SinupFauiler) {
          BuildSnakBar(context, state.errMassege);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SinupLoading,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
