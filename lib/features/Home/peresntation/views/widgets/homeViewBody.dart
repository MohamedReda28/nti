import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_app/features/Home/peresntation/views/product_cubit/product_cubit_cubit.dart';
import 'package:nti_app/features/auth/presentstion/views/signinView.dart';
import 'CustomBestSalar.dart';
import 'CustomTextFiledForSearch.dart';
import 'Custom_Home_Appbar.dart';
import 'ProductsGridviewBlocBuilder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
               // const CustomHomeAppbar(),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextFiledForSearch(),
                const SizedBox(
                  height: 12,
                ),

                Custombestsalar(
                  ontap: () {

                  },
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const ProductsGridviewBlocBuilder(),
        ],
      ),
    );
  }
}
