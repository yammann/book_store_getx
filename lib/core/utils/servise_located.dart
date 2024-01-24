import 'package:book_store_getx/core/utils/api_servise.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiseLocated() {
  getIt.registerSingleton<ApiServise>(ApiServise(Dio())); 
}
