import 'package:book_store_getx/core/utils/book_controller.dart';
import 'package:book_store_getx/feature/home/data/model/book/book.model.dart';
import 'package:book_store_getx/feature/home/presentation/controller/controller.dart';
import 'package:book_store_getx/feature/home/presentation/views/book_detailes_view.dart';
import 'package:book_store_getx/feature/home/presentation/views/home_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeListViewItem extends StatelessWidget {
  HomeListViewItem({
    super.key,
    required this.bookModel,
  });
  final BookModel? bookModel;
  final HomeController homeController = Get.put(HomeController());
  final BookController bookController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await homeController.fetchSimillerdBooks(
          categore: bookModel?.volumeInfo?.categories?[0],
        );
        bookController.updateBooModel(bookModel!);
       
        if(Get.routing.current==HomeView.id){
          Get.toNamed(BookDetailesView.id, arguments: bookModel);
        }
        else{
          Get.offNamed(BookDetailesView.id, arguments: bookModel);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: AspectRatio(
              aspectRatio: 2.6 / 4,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: bookModel?.volumeInfo!.imageLinks?.thumbnail ??
                    "https://via.placeholder.com/300",
                errorWidget: (context, url, error) =>
                    const Icon(Icons.published_with_changes),
              )),
        ),
      ),
    );
  }
}
