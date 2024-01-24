import 'package:book_store_getx/feature/search/presentation/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchTextFiled extends StatelessWidget {
  SearchTextFiled({super.key,});
  
   final SearchBookController searchBookController=Get.put(SearchBookController());

  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      onChanged: (value) {
        searchBookController.fetchSearchdBooks(bookName: value);
      },
      decoration: const InputDecoration(
          hintText: "Searche",
          suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass)),
    );
  }
}
