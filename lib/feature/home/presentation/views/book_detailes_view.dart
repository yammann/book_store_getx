import 'package:book_store_getx/core/utils/book_controller.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/book_detailes_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailesView extends StatelessWidget {
   const BookDetailesView({super.key,});
  // final BookModel? bookModel;
    static String id="/details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetBuilder(
        init: BookController(),
        builder:(controller) =>  BookDetailesBody(),)
    );
  }
}
