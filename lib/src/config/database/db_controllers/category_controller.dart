import 'package:get/get.dart';
import '../db_helper.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  DBHelper dbHelper = DBHelper.dbHelper;

  Future<void> addCategory(Category category) async {
    final db = await dbHelper.database;
    await db.insert('Category', category.toMap());
    getCategories();
  }

  Future<void> getCategories() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Category');
    categories.value = List.generate(maps.length, (i) {
      return Category.fromMap(maps[i]);
    });
  }

  Future<void> updateCategory(Category category) async {
    final db = await dbHelper.database;
    await db.update('Category', category.toMap(), where: 'id = ?', whereArgs: [category.id]);
    getCategories();
  }

  Future<void> deleteCategory(int id) async {
    final db = await dbHelper.database;
    await db.delete('Category', where: 'id = ?', whereArgs: [id]);
    getCategories();
  }
}
