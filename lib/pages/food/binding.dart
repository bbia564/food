import 'package:get/get.dart';

import 'logic.dart';

class FoodBinds extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
