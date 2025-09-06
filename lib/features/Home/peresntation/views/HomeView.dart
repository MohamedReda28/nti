import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_app/core/serveces/gitit.dart';
import 'package:nti_app/features/Home/domines/repo/product_repo.dart';
import 'package:nti_app/features/Home/peresntation/views/product_cubit/product_cubit_cubit.dart';
import 'package:nti_app/features/Home/peresntation/views/widgets/homeViewBody.dart';


class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context)=>ProductCubit(getIt<ProductRepo>())..getProducts(),
        child:const  HomeViewBody());
  }
}
