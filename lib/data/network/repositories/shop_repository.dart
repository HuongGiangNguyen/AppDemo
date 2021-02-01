import 'package:dio/dio.dart';
import 'package:flutter_base/data/network/api_constant.dart';
import 'package:flutter_base/domain/entities/shop_model.dart';
import 'package:flutter_base/domain/interfaces/shop_interfaces.dart';

class ShopRepository implements ShopInterface {
  final Dio dio;

  ShopRepository({this.dio});

  @override
  Future<List<ShopModel>> getListShop() async {
    try {
      final response = await dio.get(ApiConstant.SHOPS,
          options: await HeaderNetWorkConstant.getOptionsWithToken());
      return (response.data as List).map((e) => ShopModel.fromJson(e)).toList();
    } on DioError catch (e) {
      return Future.error(e.response.data);
    }
  }
}
