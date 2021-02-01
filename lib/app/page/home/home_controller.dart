import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/orderme_model.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/entities/rank_model.dart';
import 'package:flutter_base/domain/entities/shop_model.dart';
import 'package:flutter_base/domain/interfaces/order_interfaces.dart';
import 'package:flutter_base/domain/interfaces/orderme_interfaces.dart';
import 'package:flutter_base/domain/interfaces/rank_interfaces.dart';
import 'package:flutter_base/domain/interfaces/shop_interfaces.dart';
import 'package:get/get.dart';

class HomeController extends Controller {
  HomeController({@required this.shopInterface, this.orderMeInterface, this.rankInterface, this.orderInterface});
  final listOrderMe = List<OrderMeModel>().obs;
  final RankInterface rankInterface;
  final OrderMeInterface orderMeInterface;
  final OrderInterface orderInterface;
  final listShop = List<ShopModel>().obs;
  final listRank = List<This>().obs;
  final profileMod = ProfileModel().obs;
  final Rx<String> updatenicknames = Rx<String>();

  /// inject repo abstraction dependency
  final ShopInterface shopInterface;

  /// create a reactive status from request with initial value = loading

  Future<void> fetchOrderMe({VoidCallback callback}) async {
    status(Status.loading);
    orderMeInterface.getListOrderMe().then((data) {
      listOrderMe.clear();
      listOrderMe.addAll(data);
      print("Order me fetch: " + data.length.toString());
      status(Status.success);
      callback?.call();
    }, onError: (err) {
      status(Status.error);
    });
  }

  Future<void> fetchProfile({VoidCallback callback}) async {
    status(Status.loading);
    orderInterface.getListProfile().then((data) {
      profileMod(data);
      status(Status.success);
      callback?.call();
    }, onError: (err) {
      status(Status.error);
    });
  }

  Future<void> fetchListShop({VoidCallback callback}) async {
    status(Status.loading);

    shopInterface.getListShop().then(
      (data) {
        listShop.clear();
        listShop.addAll(data);
        status(Status.success);
        callback?.call();
      },
      onError: (err) {
        print(err);
        status(Status.error);
      },
    );
  }

  Future<void> fetchListrank({VoidCallback callback}) async {
    status(Status.loading);

    rankInterface.getListRank().then(
      (data) {
        listRank.clear();
        listRank.addAll(data);
        status(Status.success);
        callback?.call();
      },
      onError: (err) {
        print(err);
        status(Status.error);
      },
    );
  }

  Future<void> updateProfile() async {
    print(profileMod.value.toJson());
    await orderInterface.postProfile(profileMod.value.bankName, profileMod.value.branchName, profileMod.value.bankOwnerAccount,
        profileMod.value.bankAccount, profileMod.value.phone, profileMod.value.facebookNickname, profileMod.value.nicknames.join(','));
    return;
  }

  @override
  void onConnected() {
    super.onConnected();
  }
}
