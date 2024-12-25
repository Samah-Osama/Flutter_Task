part of 'get_product_cubit.dart';

sealed class GetProductState extends Equatable {
  const GetProductState();

  @override
  List<Object> get props => [];
}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

final class GetProductSuccess extends GetProductState {
  final List<ProductModel> products;

const  GetProductSuccess({required this.products});
}

final class GetProductFailure extends GetProductState {
  final String errorMessage;

  const GetProductFailure({required this.errorMessage});
}
