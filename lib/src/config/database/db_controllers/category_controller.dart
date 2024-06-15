import 'package:get/get.dart';

import '../db_helper.dart';
import '../models/category_model.dart';

class LocalCategoryController extends GetxController {
  var categories = <Category>[].obs;
  var selectedCategory =
      Rxn<Category>(); // Observable property to hold the selected category
  RxInt categoryFormId = 0.obs;
  DBHelper dbHelper = DBHelper.dbHelper;

  Future<void> addCategory(Category category) async {
    final db = await dbHelper.database;
    await db.insert('Category', category.toMap());
    print("=======================================");
    print("add");
    getCategories();
  }

  Future<void> getCategories() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Category');
    categories.value = List.generate(maps.length, (i) {
      return Category.fromMap(maps[i]);
    });
    for (var x in categories) {
      print("ID: ${x.id}");
      print("Title: ${x.title}");
      print("Tax Form ID: ${x.taxFormId}");
      print("Year: ${x.taxFormId}");
      categoryFormId.value = x.id!;
      print("Category ID: ${x.categoryId}");
    }
  }

  Future<void> updateCategory(Category category) async {
    final db = await dbHelper.database;
    await db.update('Category', category.toMap(),
        where: 'id = ?', whereArgs: [category.id]);
    await getCategories();
  }

  Future<void> deleteCategory(int id) async {
    final db = await dbHelper.database;
    await db.delete('Category', where: 'id = ?', whereArgs: [id]);
    await getCategories();
  }

  Future<void> getCategoriesByTaxFormId(int taxFormId) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query(
      'Category',
      where: 'taxFormId = ?',
      whereArgs: [taxFormId],
    );
    categories.value = List.generate(result.length, (i) {
      return Category.fromMap(result[i]);
    });
    for (var x in categories) {
      print("----------------------------------");
      print("ID: ${x.id}");
      print("Title: ${x.title}");
      print("Tax Form ID: ${x.taxFormId}");
      categoryFormId.value = x.id!;
      print("Category ID: ${x.categoryId}");
    }
  }

  Future<Category?> getCategoryByDetails(int taxFormId, int categoryId) async {
    final db = await dbHelper.database;
    categories.clear();
    final List<Map<String, dynamic>> result = await db.query(
      'Category',
      where: 'taxFormId = ? AND categoryId = ?',
      whereArgs: [taxFormId, categoryId],
    );
    if (result.isNotEmpty) {
      categories.value = List.generate(result.length, (i) {
        return Category.fromMap(result[i]);
      });
      for (var x in categories) {
        print("ID: ${x.id}");
        print("Title: ${x.title}");
        print("Tax Form ID: ${x.taxFormId}");
        categoryFormId.value = x.id!;
        print("Category ID: ${x.categoryId}");
      }
      selectedCategory.value = Category.fromMap(result.first);
      return Category.fromMap(result.first);
    } else {
      return null;
    }
  }

  // Uncomment and adjust if needed for fetching and setting the selected category
  // Future<void> fetchAndSetCategory(int taxFormId, int categoryId) async {
  //   final category = await getCategoryByDetails(taxFormId, categoryId);
  //   selectedCategory.value = category; // Set the observable property
  // }
}
