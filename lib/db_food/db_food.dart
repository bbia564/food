import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:us_food/db_food/food_entity.dart';

class DBFood extends GetxService {
  late Database dbBase;

  Future<DBFood> init() async {
    await createMedicineDB();
    return this;
  }

  createMedicineDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'food.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createFoodTable(db);
    });
  }

  createFoodTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS food (id INTEGER PRIMARY KEY, createTime TEXT, type INTEGER, image BLOB, title TEXT)');
  }

  updateFood(FoodEntity entity) async {
    await dbBase.update(
        'food',
        {
          'image': entity.image,
          'title': entity.title,
        },
        where: 'id = ?',
        whereArgs: [entity.id]);
  }

  deleteFoods(List<int> idList) async {
    await dbBase.delete('food', where: 'id IN (${idList.join(',')})');
  }

  cleanFoodData() async {
    await dbBase.delete('food');
  }

  Future<List<FoodEntity>> getFoodAllData() async {
    var result = await dbBase.query('food', orderBy: 'createTime ASC');
    return result.map((e) => FoodEntity.fromJson(e)).toList();
  }
}
