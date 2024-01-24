import 'package:book_store_getx/core/utils/style.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/book_detailes_list_view.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/home_listview.dart';
import 'package:book_store_getx/feature/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              HomeBooksListView(),
              const Padding(
                padding: EdgeInsets.only(left: 24, top: 50, bottom: 20),
                child: Text("Newest Book", style: Styles.textStyle20),
              ),
            ],
          ),
        ),
         SliverToBoxAdapter(
          child: BookDetailesListView(),
        )
      ],
    );
  }
}
