import 'package:get/get.dart';
import 'package:us_food/pages/food_first/food_first_logic.dart';
import 'package:us_food/pages/food_second/food_second_logic.dart';

import 'food_tab_logic.dart';

class FoodTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodTabLogic());
    Get.lazyPut(() => FoodFirstLogic());
    Get.lazyPut(() => FoodSecondLogic());
  }
}
