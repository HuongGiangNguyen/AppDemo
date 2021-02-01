import 'package:flutter_base/app/binding/home/home_binding.dart';
import 'package:flutter_base/app/binding/login/login_binding.dart';
import 'package:flutter_base/app/binding/order/order_binding.dart';
import 'package:flutter_base/app/binding/product/product_binding.dart';
import 'package:flutter_base/app/page/home/views/home_view.dart';
import 'package:flutter_base/app/page/home/views/profile_view.dart';
import 'package:flutter_base/app/page/login/view/login.dart';
import 'package:flutter_base/app/page/order/view/order_view.dart';
import 'package:flutter_base/app/page/product/view/product_view.dart';
import 'package:flutter_base/app/page/home/views/update_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.UPDATE,
      page: () => UpdateView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: HomeBinding(),
    ),
  ];
}
