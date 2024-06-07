import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/view/text/bill_text.dart';

import '../../../../category/model/category_model.dart';

Future<dynamic> showBill(BuildContext context, Bill bill) {
  // final controller = Get.put(BillController());
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        clipBehavior: Clip.hardEdge,
        backgroundColor: AppTheme.lightAppColors.background,
        child: Container(
          padding: const EdgeInsets.all(12),
          width: context.screenWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffffffff),
              Color(0xffA1BFE1),
            ],
          )),
          height: context.screenHeight * 0.8,
          child: Column(
            children: [
              Row(
                children: [
                  BillText.thirdText("#"),
                  BillText.secText(bill.billNumber.toString())
                ],
              ),
              Image.file(bill.img!),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Row(
                children: [
                  BillText.thirdText("قيمة الفاتورة : "),
                  BillText.secText(bill.billValue.toString())
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Row(
                children: [
                  BillText.thirdText("تاريخ الفاتورة : "),
                  BillText.secText(bill.billDate.toString())
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Row(
                children: [
                  BillText.thirdText("القيمة الضريبية : "),
                  BillText.secText(bill.taxValue.toString())
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
