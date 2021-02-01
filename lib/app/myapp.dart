import 'package:flutter/widgets.dart';
import 'package:flutter_base/app/page/home/views/store_view.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'binding/main_binding.dart';

class MyApp extends StatelessWidget {
  final String token;

  const MyApp({Key key, @required this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: token != null ? Routes.HOME : AppPages.INITIAL,
      getPages: AppPages.routes,
      smartManagement: SmartManagement.keepFactory,
    );
  }
}
