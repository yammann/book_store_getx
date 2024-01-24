import 'package:book_store_getx/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
    static String id="/HomeView";

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: HomeViewBody(),
    );
  }
}
