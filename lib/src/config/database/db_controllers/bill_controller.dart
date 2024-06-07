import 'package:get/get.dart';

import '../db_helper.dart';
import '../models/bill_model.dart';

class BillController extends GetxController {
  var bills = <Bill>[].obs;
  DBHelper dbHelper = DBHelper.dbHelper;
  @override
  void onInit() {
    super.onInit();
    getBills();
    // getCategories();
  }

  Future<void> addBill(Bill bill) async {
    final db = await dbHelper.database;
    await db.insert('Bill', bill.toMap());
    getBills();
  }

  Future<void> getBills() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Bill');
    bills.value = List.generate(maps.length, (i) {
      return Bill.fromMap(maps[i]);
    });
  }

  Future<void> updateBill(Bill bill) async {
    final db = await dbHelper.database;
    await db
        .update('Bill', bill.toMap(), where: 'id = ?', whereArgs: [bill.id]);
    getBills();
  }

  Future<void> deleteBill(int id) async {
    final db = await dbHelper.database;
    await db.delete('Bill', where: 'id = ?', whereArgs: [id]);
    getBills();
  }
}
