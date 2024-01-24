import 'package:book_store_getx/feature/splash/presentation/views/widgets/splach_view_animation.dart';
import 'package:flutter/material.dart';

class SplachView extends StatelessWidget {
  const SplachView({super.key});
  static String id ="/";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplachViewAnimation());
  }
}
