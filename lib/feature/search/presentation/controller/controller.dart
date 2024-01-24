import 'package:book_store_getx/core/failur/failur.dart';
import 'package:book_store_getx/core/utils/api_servise.dart';
import 'package:book_store_getx/feature/home/data/model/book/book.model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SearchBookController extends GetxController {

  ApiServise apiServise=ApiServise(Dio());

  List<BookModel>searchBook=<BookModel>[].obs;

  Future<List<BookModel>> fetchSearchdBooks({required String? bookName})async {
     try {
      Map<String, dynamic> data = await apiServise.get(
          endPoint: "volumes?q=subject:programming&Filtering=free-ebooks");
      searchBook.clear();
      for (Map<String, dynamic> item in data["items"]) {
       if(item["volumeInfo"]["title"].contains(bookName??"a")){
          searchBook.add(BookModel.fromJson(item));
        }
      }
      return searchBook;
    } catch (e) {
      if (e is DioException) {
        Get.snackbar("Error", "${ServerFailur.fromDioException(e)}");
        return searchBook;
      }
      Get.snackbar("Error", "${ServerFailur(e.toString())}");
      return searchBook;
    }
  }
}