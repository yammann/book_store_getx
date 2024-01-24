import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoading extends StatelessWidget {
  const LottieLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: AspectRatio(
        aspectRatio: 6.2 / 4,
        child: Center(child: Lottie.asset("assets/animation/Animation - 1705143848527.json"))),
            ),
          );
  }
}
