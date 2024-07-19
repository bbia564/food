import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:us_food/main.dart';
import 'package:us_food/pages/food_first/food_text_field.dart';

import 'food_add_logic.dart';

class FoodAddPage extends GetView<FoodAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("add-make"),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: GetBuilder<FoodAddLogic>(builder: (_) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: controller.image == null
                          ? Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 188,
                        child: <Widget>[
                          const Icon(
                            Icons.image_outlined,
                            size: 43,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Add picture',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey),
                          )
                        ].toColumn(
                            mainAxisAlignment:
                            MainAxisAlignment.center),
                      ).decorated(color: Colors.grey.withOpacity(0.2))
                          : Image.memory(
                        controller.image!,
                        width: double.infinity,
                        height: 188,
                        fit: BoxFit.cover,
                      ))
                      .gestures(onTap: () {
                    controller.imageSelected();
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Food name',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: FoodTextField(
                        maxLength: 15,
                        hintText: 'Enter food name',
                        value: controller.title,
                        onChange: (value) {
                          controller.title = value;
                        }),
                  ).decorated(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.6))),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Commit',
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
                    controller.commit(context);
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              );
            }),
          )
              .decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(15))
              .marginAll(15),
        ));
  }
}
