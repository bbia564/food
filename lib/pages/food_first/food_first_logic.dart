import 'package:get/get.dart';
import 'package:us_food/db_food/db_food.dart';
import 'package:us_food/db_food/food_entity.dart';

class FoodFirstLogic extends GetxController {

  DBFood dbFood = Get.find<DBFood>();

  var selectedIndex = 0;
  var countList = [0,0,0,0,0,0,0,0];
  var list = <FoodEntity>[].obs;

  void getData() async {
    final result = await dbFood.getFoodAllData();
    for (int i = 0; i < 6; i++) {
      final hereCount = result.where((e) => e.type == i).toList().length;
      countList[i] = hereCount;
    }
    final hereList = result.where((e) => e.type == selectedIndex).toList();
    if (hereList.length > 2) {
      list.value = hereList.sublist(0, 2);
    } else {
      list.value = hereList;
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
