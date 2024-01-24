import 'package:book_store_getx/feature/home/presentation/controller/controller.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/home_listview_item.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/lottie_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimillerBooksListView extends StatelessWidget {
  SimillerBooksListView({super.key});
  final HomeController bookController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (bookController.futureBook.isEmpty) {
          return const LottieLoading();
        }
        return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: bookController.simillerBook.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return 
                 HomeListViewItem(bookModel: bookController.simillerBook[index]);
              },
            ),
          );
      },
    );
  }
}
