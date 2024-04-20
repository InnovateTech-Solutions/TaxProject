// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Button Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ButtonPage(),
//     );
//   }
// }

// class ButtonPage extends StatefulWidget {
//   @override
//   _ButtonPageState createState() => _ButtonPageState();
// }

// class _ButtonPageState extends State<ButtonPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Button Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SecondPage()),
//                 );
//               },
//               child: Text('Open Git'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   final List<String> urls = [
//     'https://github.com/',
//     'https://gitlab.com/',
//     'https://bitbucket.org/'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose Git Provider'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () => Get.to(urls[1]),
//               child: Text('GitHub'),
//             ),
//             ElevatedButton(
//               onPressed: () => Get.to(urls[1]),
//               child: Text('GitLab'),
//             ),
//             ElevatedButton(
//               onPressed: () => Get.to(urls[1]),
//               child: Text('Bitbucket'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
