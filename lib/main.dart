import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/data/storage/hive_storage.dart';

import 'app/myapp.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;
  await HiveStorage.openBox();
  final token = await HiveStorage.getToken();
  runApp(MyApp(token: token,));
}

