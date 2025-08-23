import 'package:flutter/material.dart';
import 'package:nti_app/core/widgets/buildAppBar.dart';
import 'package:nti_app/features/auth/presentstion/views/widgets/SiginViewBoby.dart';



class SiginView extends StatelessWidget {
  const SiginView({super.key});
  static const routeName = 'SiginView';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل دخول'),
      body: const SiginVeiwBody(),
    );
  }
}