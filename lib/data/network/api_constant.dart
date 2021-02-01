import 'package:dio/dio.dart';
import 'package:flutter_base/data/storage/hive_storage.dart';

class ApiConstant {
  static const BASE_URL = 'https://demo.shopmede.com/api/';

  //API
  static const SHOPS = 'shops';
  static const PROFILE = 'profile';
  static const SETTING = 'settings';
  static const PRODUCTFORUSER = 'products/foruser';
  static const CATEGORY = 'categories/product';
  static const ORDERME = 'orders/me';
  static const RANK = 'rank/top';
  static const UPDATE = 'profile/save';
}

class HeaderNetWorkConstant {
  static final BaseOptions baseOptions = BaseOptions(baseUrl: ApiConstant.BASE_URL, connectTimeout: 10000, receiveTimeout: 10000, headers: {
    // 'Content-Type': 'application/json',
    // 'Content-Type': 'application/x-www-form-urlencoded',
    // 'charset': 'utf-8',
    'accept': 'application/json'
  });

  static Future<Options> getOptionsWithToken({
    String accept = 'application/json',
    int sendTimeout = 60000,
    int receiveTimeout = 60000,
  }) async {
    final token = await HiveStorage.getToken();
    return Options(sendTimeout: sendTimeout, receiveTimeout: receiveTimeout, headers: {
      'accept': accept,
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Access-Token': token,
    });
  }
}
