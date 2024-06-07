// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';

// // // // void main() {
// // // //   runApp(MyApp());
// // // // }

// // // // class MyApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       title: 'Button Example',
// // // //       theme: ThemeData(
// // // //         primarySwatch: Colors.blue,
// // // //       ),
// // // //       home: ButtonPage(),
// // // //     );
// // // //   }
// // // // }

// // // // class ButtonPage extends StatefulWidget {
// // // //   @override
// // // //   _ButtonPageState createState() => _ButtonPageState();
// // // // }

// // // // class _ButtonPageState extends State<ButtonPage> {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Button Example'),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: <Widget>[
// // // //             ElevatedButton(
// // // //               onPressed: () {
// // // //                 Navigator.push(
// // // //                   context,
// // // //                   MaterialPageRoute(builder: (context) => SecondPage()),
// // // //                 );
// // // //               },
// // // //               child: Text('Open Git'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class SecondPage extends StatelessWidget {
// // // //   final List<String> urls = [
// // // //     'https://github.com/',
// // // //     'https://gitlab.com/',
// // // //     'https://bitbucket.org/'
// // // //   ];

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Choose Git Provider'),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: <Widget>[
// // // //             ElevatedButton(
// // // //               onPressed: () => Get.to(urls[1]),
// // // //               child: Text('GitHub'),
// // // //             ),
// // // //             ElevatedButton(
// // // //               onPressed: () => Get.to(urls[1]),
// // // //               child: Text('GitLab'),
// // // //             ),
// // // //             ElevatedButton(
// // // //               onPressed: () => Get.to(urls[1]),
// // // //               child: Text('Bitbucket'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:tax_project/src/config/sizes/sizes.dart';
// // // import 'package:tax_project/src/config/themes/theme.dart';
// // // import 'package:tax_project/src/feature/register/view/widget/text_widget/register_text.dart';
// // // import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: MyHomePage(),
// // //     );
// // //   }
// // // }

// // // class MyHomePage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Popup Button Demo'),
// // //       ),
// // //       body: Center(
// // //         child: ElevatedButton(
// // //           onPressed: () {
// // //             _showPopupButtons(context);
// // //           },
// // //           child: Text('Show Popup Buttons'),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //  }
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Exclusive Checkbox Example',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: ExclusiveCheckboxExample(),
// //     );
// //   }
// // }

// // class ExclusiveCheckboxExample extends StatefulWidget {
// //   @override
// //   _ExclusiveCheckboxExampleState createState() =>
// //       _ExclusiveCheckboxExampleState();
// // }

// // class _ExclusiveCheckboxExampleState extends State<ExclusiveCheckboxExample> {
// //   // List to maintain the state of checkboxes

// //   RxList<bool> _checkboxValues = [false, false, false].obs;

// //   // Method to update the checkbox state exclusively
// //   void _updateCheckboxState(int index) {
// //     for (int i = 0; i < _checkboxValues.length; i++) {
// //       _checkboxValues[i] = i == index;
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Exclusive Checkbox Example'),
// //       ),
// //       body: ListView(
// //         children: [
// //           Obx(
// //             () => CheckboxListTile(
// //               title: Text('Checkbox 1'),
// //               value: _checkboxValues[0],
// //               activeColor: Colors.green,
// //               onChanged: (bool? value) {
// //                 _updateCheckboxState(0);
// //               },
// //             ),
// //           ),
// //           CheckboxListTile(
// //             title: Text('Checkbox 2'),
// //             value: _checkboxValues[1],
// //             activeColor: Colors.green,
// //             onChanged: (bool? value) {
// //               _updateCheckboxState(1);
// //             },
// //           ),
// //           CheckboxListTile(
// //             title: Text('Checkbox 3'),
// //             value: _checkboxValues[2],
// //             activeColor: Colors.green,
// //             onChanged: (bool? value) {
// //               _updateCheckboxState(2);
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Dropdown Example')),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child:
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AppTheme {
//   static final lightAppColors = _AppColors();
// }

// class _AppColors {
//   final primary = Colors.blue;
//   final background = Colors.white;
// }

// extension ScreenSizeExtension on BuildContext {
//   double get screenWidth => MediaQuery.of(this).size.width;
// }

// class FormModel {
//   FormModel({
//     required this.hintText,
//     required this.enableText,
//     required this.inputFormat,
//     required this.type,
//     required this.validator,
//     required this.invisible,
//     required this.controller,
//   });

//   final String hintText;
//   final bool enableText;
//   final List<TextInputFormatter> inputFormat;
//   final TextInputType type;
//   final String? Function(String?)? validator;
//   final bool invisible;
//   final TextEditingController controller;
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/database/db_controllers/bill_controller.dart';
import 'package:tax_project/src/config/database/models/bill_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BillView(),
    );
  }
}

class BillView extends StatelessWidget {
  final BillController billController = Get.put(BillController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bills'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: Obx(() {
              if (billController.bills.isEmpty) {
                return const Center(child: Text('No bills available'));
              }
              return ListView.builder(
                itemCount: billController.bills.length,
                itemBuilder: (context, index) {
                  final bill = billController.bills[index];
                  return ListTile(
                    leading: bill.image != null
                        ? Image.network(bill.image!)
                        : Icon(Icons.receipt),
                    title: Text('Bill No: ${bill.billNo}'),
                    subtitle: Text(
                        'Value: ${bill.billValue}, Tax: ${bill.taxValue}, Date: ${bill.date}, Category: ${bill.categoryId}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _showBillDialog(context, bill: bill),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => billController.deleteBill(bill.id!),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
          ElevatedButton(
            onPressed: () => _showBillDialog(context),
            child: Text('Add Bill'),
          ),
        ],
      ),
    );
  }

  void _showBillDialog(BuildContext context, {Bill? bill}) {
    final imageController = TextEditingController(text: bill?.image ?? '');
    final billNoController = TextEditingController(text: bill?.billNo ?? '');
    final billValueController =
        TextEditingController(text: bill?.billValue?.toString() ?? '');
    final taxValueController =
        TextEditingController(text: bill?.taxValue?.toString() ?? '');
    final dateController = TextEditingController(text: bill?.date ?? '');
    final categoryIdController =
        TextEditingController(text: bill?.categoryId?.toString() ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(bill == null ? 'Add Bill' : 'Edit Bill'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: imageController,
                  decoration: InputDecoration(labelText: 'Image URL'),
                ),
                TextField(
                  controller: billNoController,
                  decoration: InputDecoration(labelText: 'Bill No'),
                ),
                TextField(
                  controller: billValueController,
                  decoration: InputDecoration(labelText: 'Bill Value'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: taxValueController,
                  decoration: InputDecoration(labelText: 'Tax Value'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: categoryIdController,
                  decoration: InputDecoration(labelText: 'Category ID'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (bill == null) {
                  final newBill = Bill(
                    image: imageController.text,
                    billNo: billNoController.text,
                    billValue: double.tryParse(billValueController.text) ?? 0.0,
                    taxValue: double.tryParse(taxValueController.text) ?? 0.0,
                    date: dateController.text,
                    categoryId: int.tryParse(categoryIdController.text),
                  );
                  billController.addBill(newBill);
                } else {
                  final updatedBill = Bill(
                    id: bill.id,
                    image: imageController.text,
                    billNo: billNoController.text,
                    billValue: double.tryParse(billValueController.text) ?? 0.0,
                    taxValue: double.tryParse(taxValueController.text) ?? 0.0,
                    date: dateController.text,
                    categoryId: int.tryParse(categoryIdController.text),
                  );
                  billController.updateBill(updatedBill);
                }
                Navigator.of(context).pop();
              },
              child: Text(bill == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }
}
