import 'package:get/get.dart';
import 'package:hive_example/src/services/hive_service.dart';

class ConfigController extends GetxController {
  Future<void> initAppConfig() async {
    // Init hive
    await Get.put(HiveService()).initHive();
    // -----------------------------------
  }
}
