import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/database/db_controllers/user_controller.dart';
import 'package:tax_project/src/config/database/models/user_model.dart';

class UserView extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: Obx(() {
        if (userController.users.isEmpty) {
          return Center(child: Text('No users found'));
        }
        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index];
            return ListTile(
              title: Text(user.name ?? ''),
              subtitle: Text(user.email ?? ''),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => userController.deleteUser(user.id!),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddUserDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final telephoneController = TextEditingController();
    final emailController = TextEditingController();
    final taxNumberController = TextEditingController();
    final countryController = TextEditingController();
    final provinceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add User'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
                TextField(
                  controller: telephoneController,
                  decoration: InputDecoration(labelText: 'Telephone'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: taxNumberController,
                  decoration: InputDecoration(labelText: 'Tax Number'),
                ),
                TextField(
                  controller: countryController,
                  decoration: InputDecoration(labelText: 'Country'),
                ),
                TextField(
                  controller: provinceController,
                  decoration: InputDecoration(labelText: 'Province'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final user = User(
                  name: nameController.text,
                  phone: phoneController.text,
                  telephone: telephoneController.text,
                  email: emailController.text,
                  taxNumber: taxNumberController.text,
                  country: countryController.text,
                  province: provinceController.text,
                );
                userController.addUser(user);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
