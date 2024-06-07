import 'package:get/get.dart';

import '../db_helper.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  DBHelper dbHelper = DBHelper.dbHelper;

  Future<void> addUser(User user) async {
    final db = await dbHelper.database;

    print(await db.insert('Users', user.toMap()));
    getUsers();
  }

  Future<void> getUsers() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Users');
    users.value = List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  Future<void> updateUser(User user) async {
    final db = await dbHelper.database;
    await db
        .update('Users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
    getUsers();
  }

  Future<void> deleteUser(int id) async {
    final db = await dbHelper.database;
    await db.delete('Users', where: 'id = ?', whereArgs: [id]);
    getUsers();
  }
}
