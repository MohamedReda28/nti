import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failur.dart';
import '../entites/ProductEntity.dart';


abstract class ProductRepo {
  Future<Either<Failur, List<ProductEntity>>> getProduct();


}
