import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/product_model.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/interfaces/order_interfaces.dart';
import 'package:get/get.dart';

class OrderController extends Controller {
  OrderController({@required this.orderInterface});
  final OrderInterface orderInterface;
  final listSelected = List<ProductModel>().obs;

  /// inject repo abstraction dependency

  /// create a reactive status from request with initial value = loading

  final profile = ProfileModel().obs;
  final listMethod = List<String>().obs;
  final radioGroupValue = "".obs;
  final nickValue = "".obs;
  final isvisibleTextfieldNick = false.obs;
  final isvisibleTextfieldSetting = false.obs;

  int getPrice(List<ProductModel> lst) {
    int result = 0;
    for (int i = 0; i < lst.length; i++) {
      result += lst[i].price;
    }
    return result;
  }

  setRadioGroupValue(val) {
    radioGroupValue(val);
  }

  setTextFileValue(val) {
    nickValue(val);
  }

  Future<void> fetchListProfile({VoidCallback callback}) async {
    status(Status.loading);
    print("++++++++--+++");
    print(orderInterface);
    orderInterface.getListProfile().then(
      (data) {
        print("+++++++++++++");

        profile(data);
        print(data);
        status(Status.success);
        print(status);
        callback?.call();
      },
      onError: (err) {
        status(Status.error);
      },
    );
  }

  Future<void> fetchListSetting({VoidCallback callback}) async {
    status(Status.loading);

    orderInterface.getSetting().then(
      (data) {
        for (int i = 1; i < 9; i++) {
          listMethod.add(data.paymentMethods.toJson()["$i"].toString());
        }
        print("day la data: " + data.paymentMethods.toJson()[0].toString());
        // listSetting.clear();
        // listSetting.addAll(data);
        status(Status.success);

        callback?.call();
      },
      onError: (err) {
        status(Status.error);
      },
    );
  }

  @override
  void onConnected() {
    super.onConnected();
  }
}
