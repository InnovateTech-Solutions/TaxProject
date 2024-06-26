import 'package:get/get.dart';

import '../db_helper.dart';
import '../models/bill_model.dart';

class LocalBillController extends GetxController {
  var bills = <Bill>[].obs;
  DBHelper dbHelper = DBHelper.dbHelper;
  RxDouble total = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    getBills();
    // getCategories();
  }

  Future<void> addBill(Bill bill) async {
    final db = await dbHelper.database;
    await db.insert('Bill', bill.toMap());
    print("---------------------------------------");
    print("Bill added successfully");
    print(bill.billNo);
    print(bill.categoryId);
    print(bill.date);
    // getBills();
  }

  Future<void> getBills() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Bill');
    bills.value = List.generate(maps.length, (i) {
      return Bill.fromMap(maps[i]);
    });
    // for (var bill in bills) {
    //   print("---------------------------------------");
    //   // print("Bill added successfully");
    //   print(bill.billNo);
    //   print(bill.categoryId);
    //   print(bill.date);
    //   getBills();
    // }
  }

  Future<void> totalBill() async {
    double sum = 0;
    for (var bill in bills) {
      sum += bill.billValue!;
    }
    total.value = sum;
  }

  Future<void> getBillsByCategoryId(int categoryId) async {
    bills.clear();
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'Bill',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    bills.value = List.generate(maps.length, (i) {
      return Bill.fromMap(maps[i]);
    });
    total.value = 0.0;
    totalBill();
    // for (var bill in bills) {
    //   print("-----------------------------------------------");
    //   print("category id: ${bill.categoryId}");
    //   print("id: ${bill.id}, ");
    //   print("billNo: ${bill.billNo}, ");
    //   print("billValue: ${bill.billValue}, ");
    //   print("date: ${bill.date}, ");
    // }
  }

  Future<void> updateBill(Bill bill) async {
    final db = await dbHelper.database;
    await db
        .update('Bill', bill.toMap(), where: 'id = ?', whereArgs: [bill.id]);
    // getBills();
  }

  Future<void> deleteBill(int id) async {
    final db = await dbHelper.database;
    await db.delete('Bill', where: 'id = ?', whereArgs: [id]);
    // getBills();
  }
}
