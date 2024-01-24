import 'package:book_store_getx/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRate extends StatelessWidget {
  const BookRate({super.key, required this.rate, required this.count});
  final dynamic rate;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FaIcon(
          FontAwesomeIcons.solidStar,
          color: Color.fromARGB(255, 248, 223, 2),
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          rate.toString(),
          style: Styles.textStyle20,
        ),
        Text(
          " ($count)",
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
