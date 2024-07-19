import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:us_food/pages/food_first/food_first_view.dart';
import 'package:us_food/pages/food_second/food_second_view.dart';

import '../../main.dart';
import 'food_tab_logic.dart';

class FoodTabPage extends GetView<FoodTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          FoodFirstPage(),
          FoodSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navFoodBars()),
    );
  }

  Widget _navFoodBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.home_filled,color: primaryColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.settings,color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
