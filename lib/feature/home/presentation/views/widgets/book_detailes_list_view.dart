import 'package:book_store_getx/feature/home/presentation/controller/controller.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/book_list_item.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/lottie_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailesListView extends StatelessWidget {
  BookDetailesListView({super.key});
  final HomeController homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (homeController.futureBook.isEmpty) {
          return const LottieLoading();
        }
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeController.newestBook.length,
            itemBuilder: (context, index) => BookListItem(
              bookModel: homeController.newestBook[index],
            ),
            padding: EdgeInsets.zero,
          );
      },
    );
  }
}
