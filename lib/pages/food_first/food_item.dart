import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:us_food/db_food/food_entity.dart';

class FoodItem extends StatelessWidget {
  const FoodItem(this.entity,
      {this.isEdit = false, this.isSelected = false, Key? key})
      : super(key: key);

  final FoodEntity entity;
  final bool isEdit;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          LayoutBuilder(builder: (_, c) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                entity.image,
                width: c.maxWidth,
                height: c.maxWidth,
                fit: BoxFit.cover,
              ),
            );
          }),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: Text(
              entity.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ).decorated(
              color: Colors.black.withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          Visibility(
            visible: isEdit,
            child: Positioned(
                top: 10,
                left: 10,
                child: Image.asset(
                  'assets/${isSelected ? 'itemSelected' : 'itemUnselect'}.webp',
                  width: 17,
                  height: 17,
                )),
          )
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        entity.timeString,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      )
    ].toColumn();
  }
}
