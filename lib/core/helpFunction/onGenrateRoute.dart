import 'package:flutter/material.dart';
import 'package:nti_app/features/auth/presentstion/views/signinView.dart';

import '../../features/auth/presentstion/views/SignupView.dart';

Route<dynamic>onGenrateRoute(RouteSettings setting){

  switch(setting.name){

    case SiginView.routeName :
    return MaterialPageRoute(builder: (context)=> const SiginView());
    case SignUpView.routeName :
      return MaterialPageRoute(builder: (context)=> const SignUpView());
    
    default: return MaterialPageRoute(builder: (context)=> const Scaffold());
  
  }
}