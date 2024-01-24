import 'package:book_store_getx/feature/home/presentation/views/widgets/book_list_item.dart';
import 'package:book_store_getx/feature/search/presentation/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultList extends StatelessWidget {
  SearchResultList({super.key});

  final SearchBookController searchController = Get.put(SearchBookController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: searchController.searchBook.length,
          itemBuilder: (context, index) {
            return BookListItem(bookModel: searchController.searchBook[index]);
          }),
    );
  }
}
