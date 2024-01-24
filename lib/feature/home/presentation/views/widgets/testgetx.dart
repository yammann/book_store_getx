import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppBarAnimationController extends GetxController {
  RxBool isAppBarExpanded = true.obs;
  double appBarAlpha = 1.0;

  void handleScroll(double scrollOffset, double expandedHeight) {
    double alpha = (expandedHeight - scrollOffset) / expandedHeight;
    isAppBarExpanded.value = alpha > 0.5; // Adjust the threshold as needed
    appBarAlpha = alpha.clamp(0.0, 1.0);
    update();
  }
}