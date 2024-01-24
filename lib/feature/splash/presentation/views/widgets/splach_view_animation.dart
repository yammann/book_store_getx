import 'package:book_store_getx/feature/home/presentation/controller/controller.dart';
import 'package:book_store_getx/feature/home/presentation/views/home_view.dart';
import 'package:book_store_getx/feature/splash/presentation/views/widgets/splach_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplachViewAnimation extends StatefulWidget {
  const SplachViewAnimation({super.key});

  @override
  State<SplachViewAnimation> createState() => _SplachViewAnimationState();
}

class _SplachViewAnimationState extends State<SplachViewAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slaidAnimation;
  final HomeController bookController=Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    initSlidAnimation();

    navigateToHomeView();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 3), () async{
      await bookController.fetchFeaturedBooks();
      await bookController.fetchNewsetBooks();
      Get.off(() => const HomeView(),
          transition: Transition.leftToRight, duration: const Duration(seconds: 1));
    });
  }

  void initSlidAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slaidAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slaidAnimation,
      builder: (context, _) {
        return SlideTransition(
            position: slaidAnimation, child: const SplachViewBody());
      },
    );
  }
}
