
import 'package:get/get.dart';
import 'package:us_food/pages/food_first/food_add/food_add_binding.dart';
import 'package:us_food/pages/food_first/food_add/food_add_view.dart';
import 'package:us_food/pages/food_first/food_first_binding.dart';
import 'package:us_food/pages/food_first/food_first_view.dart';
import 'package:us_food/pages/food_first/food_list/food_list_binding.dart';
import 'package:us_food/pages/food_first/food_list/food_list_view.dart';
import 'package:us_food/pages/food_second/food_second_binding.dart';
import 'package:us_food/pages/food_tab/food_tab_binding.dart';
import 'package:us_food/pages/food_tab/food_tab_view.dart';
import 'package:us_food/router/food_names.dart';

import '../pages/food_second/food_second_view.dart';

class FoodPages {

  static pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
  }) {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      preventDuplicates: true,
      transition: Transition.cupertino,
      popGesture: true,
    );
  }


  static List<GetPage> list = [
    pageBuilder(name: FoodNames.foodTab, page: () => FoodTabPage(), binding: FoodTabBinding()),
    pageBuilder(name: FoodNames.foodFirst, page: () => FoodFirstPage(),binding: FoodFirstBinding()),
    pageBuilder(name: FoodNames.foodSecond, page: () => FoodSecondPage(),binding: FoodSecondBinding()),
    pageBuilder(name: FoodNames.foodAdd, page: () => FoodAddPage(),binding: FoodAddBinding()),
    pageBuilder(name: FoodNames.foodList, page: () => FoodListPage(),binding: FoodListBinding()),
  ];
}