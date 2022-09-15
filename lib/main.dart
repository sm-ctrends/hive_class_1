import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_example/src/app.dart';
import 'package:hive_example/src/controllers/config_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Default config
  await Get.put(ConfigController()).initAppConfig();
  // --------------------------------------------------
  runApp(App());
}
