import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_app/features/auth/presentstion/cubits/sinup/sinup_cubit.dart';
import 'package:nti_app/features/auth/presentstion/views/SignupView.dart';
import '../../../../../core/widgets/BuildSnakBar.dart';
import '../../../../../core/widgets/Custom Password Feild.dart';
import '../../../../../core/widgets/CustomTextField.dart';
import '../../../../../core/widgets/Custom_Botton.dart';
import 'Dont Have Account Widgh.dart';
import 'Terms And Condetion.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool change = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hinttext: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hinttext: ' البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordFeild(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndCondetion(
                changed: (value) {
                  change = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomBotton(
                title: 'إنشاء حساب جديد',
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (change) {
                      context.read<SinupCubit>().createUserWithEmailAndPassword(
                          name: name, email: email, password: password);
                    } else {
                      BuildSnakBar(context, 'يجب الموافقه علي الشروط والاحكام');
                    }
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 26,
              ),
              DontHaveAccountWidgh(
                textone: 'تمتلك حساب بالفعل؟',
                texttwo: 'قم بتسجيل الدخول',
                ontap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
