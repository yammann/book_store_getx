import 'package:book_store_getx/feature/home/data/model/book/book.model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoubleButtonPriceAndFree extends StatelessWidget {
  const DoubleButtonPriceAndFree({super.key, required this.bookModel});
  final BookModel? bookModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ))),
                  onPressed: () {},
                  child: const Text(
                    "Free",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 48,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 115, 1),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ))),
                  onPressed: () async {
                    final Uri url =
                        Uri.parse(bookModel?.volumeInfo?.previewLink??"");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  child: const Text(
                    "Preview",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
