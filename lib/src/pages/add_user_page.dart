import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class AddUserPage extends StatelessWidget {
  final userC = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addd User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Obx(() => Text(userC.name.value)),
              TextField(
                onChanged: userC.name,
                decoration: InputDecoration(
                  labelText: 'name',
                ),
              ),
              TextField(
                onChanged: userC.username,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              TextField(
                onChanged: userC.email,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: Get.width,
                child: TextButton(
                  onPressed: userC.addUserData,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
