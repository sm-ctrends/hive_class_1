import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/src/hive_models/user.dart';
import 'package:uuid/uuid.dart';

class UserController extends GetxController {
  final uuid = Uuid();

  // @ Sm Shohag - 15/09/2022
  // User Data
  final name = RxString('');
  final email = RxString('');
  final username = RxString('');

  // --------------------------------------

  void addUserData() async {
    final userBox = Hive.box<User>('users');

    final id = uuid.v1();

    final userData = User(
      id: id,
      email: email.value,
      name: name.value,
      username: username.value,
    );

    if (name.value.isNotEmpty &&
        email.value.contains('@') &&
        username.value.isNotEmpty) {
      await userBox.put(id, userData);

      print('User added');

      Get.back();
    } else {
      Get.snackbar(
        'Attention!!!',
        'Please validate form before submit',
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
