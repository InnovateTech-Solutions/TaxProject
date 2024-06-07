import 'package:get/get.dart';
import '../db_helper.dart';
import '../models/other_model.dart';

class OtherController extends GetxController {
  var others = <Other>[].obs;
  DBHelper dbHelper = DBHelper.dbHelper;

  Future<void> addOther(Other other) async {
    final db = await dbHelper.database;
    await db.insert('Other', other.toMap());
    getOthers();
  }

  Future<void> getOthers() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Other');
    others.value = List.generate(maps.length, (i) {
      return Other.fromMap(maps[i]);
    });
  }

  Future<void> updateOther(Other other) async {
    final db = await dbHelper.database;
    await db.update('Other', other.toMap(), where: 'id = ?', whereArgs: [other.id]);
    getOthers();
  }

  Future<void> deleteOther(int id) async {
    final db = await dbHelper.database;
    await db.delete('Other', where: 'id = ?', whereArgs: [id]);
    getOthers();
  }
}
