import 'package:flutter_base/app/page/order/order_controller.dart';
import 'package:flutter_base/data/network/repositories/order_reposistory.dart';
import 'package:flutter_base/domain/interfaces/order_interfaces.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderInterface>(() => OrderRepository(dio: Get.find()));
    Get.lazyPut(() => OrderController(orderInterface: Get.find()));
  }
}
