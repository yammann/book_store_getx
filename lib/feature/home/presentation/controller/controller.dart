import 'package:book_store_getx/core/failur/failur.dart';
import 'package:book_store_getx/core/utils/api_servise.dart';
import 'package:book_store_getx/feature/home/data/model/book/book.model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ApiServise apiServise = ApiServise(Dio());

  List<BookModel> futureBook = <BookModel>[].obs;

  List<BookModel> newestBook = <BookModel>[].obs;

  List<BookModel> simillerBook = <BookModel>[].obs;

  Future<List<BookModel>> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> data = await apiServise.get(
          endPoint: "volumes?q=subject:programming&Filtering=free-ebooks");
      futureBook.clear();
      for (var item in data["items"]) {
        futureBook.add(BookModel.fromJson(item));
      }
      return futureBook;
    } catch (e) {
      if (e is DioException) {
        Get.snackbar("Error", "${ServerFailur.fromDioException(e)}");
        return futureBook;
      }
      Get.snackbar("Error", "${ServerFailur(e.toString())}");
      return futureBook;
    }
  }

  Future<List<BookModel>> fetchNewsetBooks() async {
    try {
      Map<String, dynamic> data = await apiServise.get(
          endPoint: "volumes?q=subject:computer science&Filtering=free-ebooks");
      newestBook.clear();
      for (var item in data["items"]) {
        newestBook.add(BookModel.fromJson(item));
      }
      return newestBook;
    } catch (e) {
      if (e is DioException) {
        Get.snackbar("Error", "${ServerFailur.fromDioException(e)}");
        return newestBook;
      }
      Get.snackbar("Error", "${ServerFailur(e.toString())}");
      return newestBook;
    }
  }

  Future<List<BookModel>> fetchSimillerdBooks(
      {required String? categore}) async {
    try {
      Map<String, dynamic> data = await apiServise.get(
          endPoint:
              "volumes?q=subject:${categore ?? "programming"}&Filtering=free-ebooks&Sorting=relevance");
      simillerBook.clear();
      if (data["items"] != null) {
        for (var item in data["items"]) {
          simillerBook.add(BookModel.fromJson(item));
        }
      }
      return simillerBook;
    } catch (e) {
      if (e is DioException) {
        Get.snackbar("Error", "${ServerFailur.fromDioException(e)}");
        return simillerBook;
      }
      Get.snackbar("Error", "${ServerFailur(e.toString())}");
      return simillerBook;
    }
  }

  // 
}
