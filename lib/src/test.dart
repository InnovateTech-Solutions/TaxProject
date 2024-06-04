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
