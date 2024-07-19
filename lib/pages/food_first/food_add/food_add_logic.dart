

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:us_food/db_food/db_food.dart';

class FoodAddLogic extends GetxController {

  DBFood dbFood = Get.find<DBFood>();

  int type = Get.arguments;
  Uint8List? image;
  String title = "";

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check the album permissions or try another picture.');
      return;
    }
  }

  void commit(BuildContext context) async {
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select a picture');
      return;
    }
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the food name');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    await dbFood.dbBase.insert('food', {
      'createTime': DateTime.now().toIso8601String(),
      'type': type,
      'image': image,
      'title': title,
    });
    Fluttertoast.showToast(msg: 'Success');
    Get.back();
  }

}
