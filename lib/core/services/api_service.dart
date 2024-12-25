import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  
  Future<List<dynamic>> get({required String url}) async {
    Response response = await dio.get(url);
    return response.data;
  }
}
