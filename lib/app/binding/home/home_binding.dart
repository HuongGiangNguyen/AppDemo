import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/data/network/repositories/orderme_reposistory.dart';
import 'package:flutter_base/data/network/repositories/rank_reposistory.dart';
import 'package:flutter_base/data/network/repositories/shop_repository.dart';
import 'package:flutter_base/data/network/repositories/order_reposistory.dart';
import 'package:flutter_base/domain/interfaces/orderme_interfaces.dart';
import 'package:flutter_base/domain/interfaces/rank_interfaces.dart';
import 'package:flutter_base/domain/interfaces/shop_interfaces.dart';
import 'package:flutter_base/domain/interfaces/order_interfaces.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopInterface>(() => ShopRepository(dio: Get.find()));
    Get.lazyPut<OrderMeInterface>(() => OrderMeRepository(dio: Get.find()));
    Get.lazyPut<RankInterface>(() => RankReposistory(dio: Get.find()));
    Get.lazyPut<OrderInterface>(() => OrderRepository(dio: Get.find()));
    Get.lazyPut(() =>
        HomeController(shopInterface: Get.find(), orderMeInterface: Get.find(), rankInterface: Get.find(), orderInterface: Get.find()));
  }
}
