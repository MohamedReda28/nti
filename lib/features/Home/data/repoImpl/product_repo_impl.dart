import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nti_app/core/serveces/ApiServese.dart';
import '../../../../core/errors/Failur.dart';
import '../../domines/entites/ProductEntity.dart';
import '../../domines/repo/product_repo.dart';
import '../models/product_model/product_model.dart';


class ProductRepoImpl implements ProductRepo {
  final ApiServese apiServese;
  ProductRepoImpl({required this.apiServese});

  @override
  Future<Either<Failur, List<ProductEntity>>> getProduct() async {
    try {
     final data = await apiServese.get(endPoint: 'products') as List<dynamic>;

final products = data
    .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
    .toList();

final productEntit = products.map((e) => e.toEntity()).toList();

return right(productEntit);
    } catch (e) {
      log('Api ${e.toString()}');
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
         errMassege:  e.toString(),
        ),
      );
    }
  }


}
