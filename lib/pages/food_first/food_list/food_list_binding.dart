import 'package:get/get.dart';

import 'food_list_logic.dart';

class FoodListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodListLogic());
  }
}
