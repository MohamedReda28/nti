import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/helpFunction/git_dammy_Product.dart';
import '../../../../../core/widgets/customErrorWidght.dart';
import '../product_cubit/product_cubit_cubit.dart';
import 'ProductsGridview.dart';

class ProductsGridviewBlocBuilder extends StatelessWidget {
  const ProductsGridviewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductCubitSuccess) {
        return ProductsGridview(products: state.products);
      } else if (state is ProductCubitFailure) {
        return Customerrorwidght(text: state.message);
      } else if (state is ProductCubitLoading) {
        return Skeletonizer.sliver(
          enabled: true,
          child: ProductsGridview(products: getDomyProducts()),
        );
      } else {
        return const Center(child: Text('No data yet'));
      }
    });
  }
}
