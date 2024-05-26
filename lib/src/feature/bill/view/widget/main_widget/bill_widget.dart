import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/controller/bill_controller.dart';
import 'package:tax_project/src/feature/bill/view/page/bill_img.dart';
import 'package:tax_project/src/feature/bill/view/widget/collection_widgets/bill_dialog.dart';
import 'package:tax_project/src/feature/category/model/category_model.dart';
import 'package:tax_project/src/feature/dashboard/view/pages/dashboard_page.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';

class BillWidget extends StatefulWidget {
  const BillWidget({
    super.key,
    required this.year,
    required this.category,
    required this.periods,
    required this.equation,
  });
  final String year;
  final String category;
  final String periods;
  final double equation;

  @override
  State<BillWidget> createState() => _BillWidgetState();
}

class _BillWidgetState extends State<BillWidget> {
  Future<void> addBillsCategory() async {}

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BillController());

    List<CategoryModel> category = controller.category
        .where((cat) => cat.title == widget.category)
        .toList();

    List<Bill> bills = controller.bills
        .where(
            (bill) => bill.type == widget.category && bill.year == widget.year)
        .toList();

    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth * .7,
            height: context.screenHeight * 0.06,
            decoration: BoxDecoration(
                color: AppTheme.lightAppColors.primary,
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(12))),
            child: GestureDetector(
              onTap: () {
                // Get.to(BillImgPage(
                //     periods: periods, year: year, category: category));
              },
              child: Row(
                children: [
                  Text(
                    "  المجموع ${controller.total.value.toString()} دينار",
                    style: TextStyle(
                        color: AppTheme.lightAppColors.background,
                        fontSize: 25,
                        fontFamily: 'Poppins-Regular'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: context.screenHeight * .03,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: context.screenWidth,
            height: bills.length < 6
                ? (context.screenHeight * .09 * bills.length)
                : context.screenHeight * .55,
            child: ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(bills[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      bills.remove(bills[index].id);
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      showBill(context, bills[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: context.screenWidth * .7,
                      height: context.screenHeight * 0.08,
                      decoration: BoxDecoration(
                          color: AppTheme.lightAppColors.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            bills[index].billDate.toString(),
                            style: TextStyle(
                                color: AppTheme.lightAppColors.background,
                                fontSize: 25,
                                fontFamily: 'Poppins-Regular'),
                          ),
                          Text(
                            "# ${bills[index].billValue.toString()}",
                            style: TextStyle(
                                color: AppTheme.lightAppColors.background,
                                fontSize: 25,
                                fontFamily: 'Poppins-Regular'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(BillImgPage(
                  periods: widget.periods,
                  year: widget.year,
                  equation: widget.equation,
                  category: widget.category));
            },
            child: Container(
                margin: const EdgeInsets.only(right: 30),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: const Color(0xffA1BFE1),
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.add,
                  color: AppTheme.lightAppColors.background,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: AppButton(
                title: "التالي",
                onTap: () {
                  Get.to(const DashboardPage());
                }),
          )
        ],
      ),
    );
  }
}
