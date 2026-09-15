// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.homeRepo) : super(GetProductsInitial());
  final HomeRepo homeRepo;

  List<Product> products = [];

  Future<void> getProducts({required String category}) async {
    emit(GetProductsLoading());
    var result = category == 'All'
        ? await homeRepo.getAllProducts()
        : await homeRepo.getProductsByCategory(category: category);

    result.fold(
      (failure) {
        emit(GetProductsFailure(failure.errorMessage));
      },
      (products) {
        this.products = products;
        emit(GetProductsSuccess(products));
      },
    );
  }

}
