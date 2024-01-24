import 'package:book_store_getx/core/utils/book_controller.dart';
import 'package:book_store_getx/core/utils/constants.dart';
import 'package:book_store_getx/core/utils/servise_located.dart';
import 'package:book_store_getx/feature/home/presentation/views/book_detailes_view.dart';
import 'package:book_store_getx/feature/home/presentation/views/home_view.dart';
import 'package:book_store_getx/feature/search/presentation/view/search_view.dart';
import 'package:book_store_getx/feature/splash/presentation/views/splach_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUpServiseLocated();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(BookController());
    return GetMaterialApp(
      initialRoute: SplachView.id,
       getPages: [
          GetPage(name: SplachView.id, page: ()=>const SplachView()),
          GetPage(name: HomeView.id, page: () => const HomeView()),
          GetPage(name: SearchView.id, page: () => const SearchView()),
          GetPage(name: BookDetailesView.id, page: () =>  const BookDetailesView())
        ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      home: const SplachView(),
    );
  }
}
