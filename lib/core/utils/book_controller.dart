import 'package:book_store_getx/feature/home/data/model/book/book.model.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  
BookModel bookModel =BookModel();

  BookModel updateBooModel(BookModel newBookModel){
      bookModel=newBookModel;
      update();
      return bookModel;
      
  }
}