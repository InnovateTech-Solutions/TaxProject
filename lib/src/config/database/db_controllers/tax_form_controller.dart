import 'package:get/get.dart';
import '../db_helper.dart';
import '../models/tax_form_model.dart';

class TaxFormController extends GetxController {
  var taxForms = <TaxForm>[].obs;
  DBHelper dbHelper = DBHelper.dbHelper;

  Future<void> addTaxForm(TaxForm taxForm) async {
    final db = await dbHelper.database;
    await db.insert('TaxForm', taxForm.toMap());
    getTaxForms();
  }

  Future<void> getTaxForms() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('TaxForm');
    taxForms.value = List.generate(maps.length, (i) {
      return TaxForm.fromMap(maps[i]);
    });
  }

  Future<void> updateTaxForm(TaxForm taxForm) async {
    final db = await dbHelper.database;
    await db.update('TaxForm', taxForm.toMap(), where: 'id = ?', whereArgs: [taxForm.id]);
    getTaxForms();
  }

  Future<void> deleteTaxForm(int id) async {
    final db = await dbHelper.database;
    await db.delete('TaxForm', where: 'id = ?', whereArgs: [id]);
    getTaxForms();
  }
}
