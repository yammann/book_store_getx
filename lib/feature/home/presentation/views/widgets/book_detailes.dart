import 'package:book_store_getx/feature/home/data/model/book/book.model.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/book_rate.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/double_button_price_free.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/home_listview_item.dart';
import 'package:flutter/material.dart';

class BookDetailes extends StatelessWidget {
  const BookDetailes({super.key, required this.bookModel});
  final BookModel? bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
         Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .20),
            child: HomeListViewItem(
              bookModel: bookModel,
            ), 
          ),
          Text(
            bookModel?.volumeInfo?.title??"",
            style: const TextStyle(fontSize: 35),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            bookModel?.volumeInfo?.authors?[0]??"",
            style: const TextStyle(fontSize: 20, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          BookRate(
            rate: bookModel?.volumeInfo!.averageRating ?? 0,
            count: bookModel?.volumeInfo!.ratingsCount ?? 0,
          ),
          const SizedBox(
            height: 30,
          ),
           DoubleButtonPriceAndFree(
            bookModel: bookModel,
          ),
          
      ],
    );
  }
}