import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domines/entites/ProductEntity.dart';
import '../../../domines/repo/product_repo.dart';
part 'product_cubit_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo,) : super(ProductCubitInitial());
  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductCubitLoading());
    final result = await productRepo.getProduct();
    result.fold(
      (failur) => emit(ProductCubitFailure(failur.errMassege)),
      (products) {
        emit(ProductCubitSuccess(products));
      }
    );
  }


   
}
