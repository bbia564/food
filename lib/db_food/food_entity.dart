

import 'dart:typed_data';

import 'package:intl/intl.dart';

class FoodEntity {

  int id;
  DateTime createTime;
  int type;
  Uint8List image;
  String title;

  FoodEntity({
    required this.id,
    required this.createTime,
    required this.type,
    required this.image,
    required this.title,
  });

  factory FoodEntity.fromJson(Map<String, dynamic> json) {
    return FoodEntity(
      id: json['id'] as int,
      createTime: DateTime.parse(json['createTime'] as String),
      type: json['type'] as int,
      image: json['image'] as Uint8List,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'type': type,
      'image': image,
      'title': title,
    };
  }

  String get timeString {
    return DateFormat('yyyy/MM/dd').format(createTime);
  }
}