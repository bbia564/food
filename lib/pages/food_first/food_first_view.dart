import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:us_food/main.dart';
import 'package:us_food/pages/food_first/food_item.dart';

import 'food_first_logic.dart';

class FoodFirstPage extends GetView<FoodFirstLogic> {
  Widget _item(int index) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.all(15),
      child: <Widget>[
        Image.asset(
          'assets/image$index.webp',
          width: 28,
          height: 28,
        ),
        Expanded(
            child: Text(
          foodTitles[index],
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ).marginSymmetric(horizontal: 20)),
        Text(
          controller.countList[index].toString(),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        )
      ].toRow(),
    )
        .decorated(
            color: index == controller.selectedIndex
                ? const Color(0xffe9fdd0)
                : Colors.white,
            border: Border.all(
                color: index == controller.selectedIndex
                    ? const Color(0xff66bb00)
                    : Colors.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      controller.selectedIndex = index;
      controller.update();
      controller.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of American cuisines'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              GetBuilder<FoodFirstLogic>(init: FoodFirstLogic(),builder: (_) {
                return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: foodTitles.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return _item(index);
                    });
              }),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                child: <Widget>[
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Add Make',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10))
                      .gestures(onTap: () {
                    Get.toNamed('/food_add',
                            arguments: controller.selectedIndex)
                        ?.then((_) {
                      controller.getData();
                    });
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  <Widget>[
                    <Widget>[
                      Icon(
                        Icons.adjust_outlined,
                        size: 20,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Produced record',
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ].toRow(),
                    <Widget>[
                      const Text(
                        'More',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: Colors.grey,
                      )
                    ].toRow().gestures(onTap: () {
                      Get.toNamed('/food_list',
                              arguments: controller.selectedIndex)
                          ?.then((_) {
                        controller.getData();
                      });
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  Divider(
                    height: 25,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  Obx(() {
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
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ].toColumn(
                                mainAxisAlignment: MainAxisAlignment.center),
                          ).constrained(minHeight: 100)
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.85),
                            itemCount: controller.list.value.length,
                            itemBuilder: (_, index) {
                              final entity = controller.list.value[index];
                              return FoodItem(entity);
                            });
                  })
                ].toColumn(),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(10))
            ].toColumn(),
          ).marginAll(15),
        ),
      ),
    );
  }
}
