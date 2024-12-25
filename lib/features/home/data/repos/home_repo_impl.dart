import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/services/api_service.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProduct() async {
    try {
      var data = await apiService.get(url: 'https://fakestoreapi.com/products');
      List<ProductModel> productList = [];
      for (var product in data) {
        productList.add(ProductModel.fromJson(product));
      }
  return right(productList);
      
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
