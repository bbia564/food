import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:us_food/main.dart';
import 'package:us_food/pages/food_first/food_item.dart';

import 'food_list_logic.dart';

class FoodListPage extends GetView<FoodListLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodListLogic>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text(foodTitles[controller.type]),
            actions: [
              Text(
                controller.isEdit ? 'Delete' : 'Edit',
                style: TextStyle(
                    color: controller.isEdit ? primaryColor : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ).marginOnly(right: 20).gestures(onTap: () {
                if (controller.isEdit) {
                  if (controller.selectedList.isEmpty) {
                    Fluttertoast.showToast(msg: 'Please select data to delete');
                    return;
                  }
                  controller.deleteData();
                } else {
                  controller.isEdit = !controller.isEdit;
                  controller.update();
                }
              })
            ],
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Obx(() {
                return controller.list.value.isEmpty
                    ? Container(
                        child: <Widget>[
                          Image.asset('assets/noData.webp',
                              width: 33, height: 39, fit: BoxFit.cover),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'No data',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
                      ).constrained(minHeight: 100)
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.85),
                        itemCount: controller.list.value.length,
                        itemBuilder: (_, index) {
                          final entity = controller.list.value[index];
                          return FoodItem(
                            entity,
                            isEdit: controller.isEdit,
                            isSelected: controller.selectedList.contains(entity),
                          ).gestures(onTap: () {
                            if (controller.selectedList.contains(entity)) {
                              controller.selectedList.remove(entity);
                            } else {
                              controller.selectedList.add(entity);
                            }
                            controller.update();
                          });
                        });
              }),
            )
                .decorated(
                    color: Colors.white, borderRadius: BorderRadius.circular(10))
                .marginAll(15),
          ));
    });
  }
}
