import 'package:get/get.dart';

import '../db_helper.dart';
import '../models/tax_form_model.dart';

class TaxFormController extends GetxController {
  var taxForms = <TaxForm>[].obs;
  RxInt taxID = 0.obs;
  DBHelper dbHelper = DBHelper.dbHelper;

  Future<void> addTaxForm(TaxForm taxForm) async {
    final db = await dbHelper.database;
    await db.insert('TaxForm', taxForm.toMap());
    await getTaxForms();
    print("-----------------------------------------------");
    print("Tax Form Added");
  }

  Future<void> getTaxForms() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('TaxForm');
    taxForms.value = List.generate(maps.length, (i) {
      return TaxForm.fromMap(maps[i]);
    });
    // Print the value of taxForms
    for (var x in taxForms) {
      print("tax id: ${x.id} Period: --> ${x.taxPeriod}+++${x.year}");
    }
  }

  Future<void> getTaxFormsByYearAndTaxPeriod(
      String year, String taxPeriod) async {
    taxForms.clear();
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'TaxForm',
      where: 'year = ? AND taxPeriod = ?',
      whereArgs: [year, taxPeriod],
    );
    var filteredTaxForms = List.generate(maps.length, (i) {
      return TaxForm.fromMap(maps[i]);
    });
    // Update the observable list
    taxForms.value = filteredTaxForms;
    // Print the value of taxForms
    for (var x in taxForms) {
      taxID.value = x.id!;
      print(taxID.value);
      print(
          "TaxForm ID: ${x.id} Period: --> ${x.taxPeriod} Year: ${x.year} Category: ${x.taxPeriod}");
    }
  }

  Future<void> updateTaxForm(TaxForm taxForm) async {
    final db = await dbHelper.database;
    await db.update('TaxForm', taxForm.toMap(),
        where: 'id = ?', whereArgs: [taxForm.id]);
    // await getTaxForms();
  }

  Future<void> deleteTaxForm(int id) async {
    final db = await dbHelper.database;
    await db.delete('TaxForm', where: 'id = ?', whereArgs: [id]);
    await getTaxForms();
  }
}
