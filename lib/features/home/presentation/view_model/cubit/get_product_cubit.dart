import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/core/services/api_service.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit(this.homeRepo) : super(GetProductInitial());
  final HomeRepo homeRepo;

  Future<void> getAllProduct() async {
    emit(GetProductLoading());
    var result = await homeRepo.getAllProduct();
    result.fold(
      (failure) {
        emit(GetProductFailure(errorMessage: failure.errorMessage));
      },
      (product) {
        emit(GetProductSuccess(products: product));
      },
    );
  }
}
