import 'package:book_store_getx/feature/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class BookDetailesAppbar extends StatelessWidget {
  const BookDetailesAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close)),
      ),
    );
  }
}
