import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_app/features/auth/presentstion/cubits/siginin/signin_cubit_cubit.dart';
import '../../../../../core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/uitels/app_images.dart';
import '../../../../../core/widgets/Custom Password Feild.dart';
import '../../../../../core/widgets/CustomTextField.dart';
import '../../../../../core/widgets/Custom_Botton.dart';
import '../SignupView.dart';
import 'Custom Driver And Text.dart';
import 'Dont Have Account Widgh.dart';
import 'SocailLogin By.dart';

class SiginVeiwBody extends StatefulWidget {
  const SiginVeiwBody({super.key});

  @override
  State<SiginVeiwBody> createState() => _SiginVeiwBodyState();
}

class _SiginVeiwBodyState extends State<SiginVeiwBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hinttext: 'البريد الإلكتروني',
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      //Navigator.pushReplacementNamed(context, ForgetpassView.routeName);
                    },
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: AppStyle.semibold13
                          .copyWith(color: AppColor.lightPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              Center(
                child: CustomBotton(
                  title: 'تسجيل دخول',
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SigninCubit>().signInWithEmailAndPassword(email: email, password: password);

                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              DontHaveAccountWidgh(
                textone: 'لا تمتلك حساب؟',
                texttwo: 'قم نانشاء حساب',
                ontap: () {
                  Navigator.pushNamed(context,SignUpView.routeName);
                },
              ),
              const SizedBox(
                height: 33,
              ),
              const CustomDriverAndOr(),
              const SizedBox(
                height: 16,
              ),
              CustomLoginBy(
                ontap: () {},
                title: 'تسجيل بواسطة جوجل',
                image: Assets.imagesGoogleIcons,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
