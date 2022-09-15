import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/src/hive_models/user.dart';
import 'package:path_provider/path_provider.dart';

class HiveService extends GetxService {
  Future<void> initHive() async {
    final appDir = await getApplicationDocumentsDirectory();

    Hive.init(appDir.path);

    Hive.registerAdapter(UserAdapter());

    await Hive.openBox<User>('users');

    print('init User box');

    print('Init hive');
  }
}
