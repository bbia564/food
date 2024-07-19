import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:us_food/db_food/db_food.dart';

import '../../../db_food/food_entity.dart';

class FoodListLogic extends GetxController {
  DBFood dbFood = Get.find<DBFood>();

  int type = Get.arguments;

  var isEdit = false;

  var list = <FoodEntity>[].obs;
  var selectedList = <FoodEntity>[];

  void getData() async {
    final result = await dbFood.getFoodAllData();
    list.value = result.where((e) => e.type == type).toList();
  }

  deleteData() async {
    Get.dialog(AlertDialog(
      title: const Text('Do you want to delete this data?',textAlign: TextAlign.center,),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () async {
            await dbFood.deleteFoods(selectedList.map((e) => e.id).toList());
            selectedList.clear();
            isEdit = false;
            getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
