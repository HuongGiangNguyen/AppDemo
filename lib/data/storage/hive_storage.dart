import 'package:flutter_base/data/storage/storage_constant.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static Box box;

  static Future openBox() async {
    await Hive.initFlutter();
    box = await Hive.openBox(HiveKeys.BOX_NAME_DEV);
    return;
  }

  static Future<void> persistToken(String token) async {
    await box.put(HiveKeys.ACCESS_TOKEN, token);
  }

  static Future<String> getToken() async {
    return await box.get(HiveKeys.ACCESS_TOKEN);
  }

  static closeBox() async {
    await box.close();
  }
}
