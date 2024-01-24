import 'package:dio/dio.dart';

class ApiServise {
  final String _baseurl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;

  ApiServise(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var respon = await _dio.get("$_baseurl$endPoint");
    return respon.data;
  }
}
