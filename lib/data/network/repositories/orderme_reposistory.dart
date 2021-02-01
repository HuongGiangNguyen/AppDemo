import 'package:dio/dio.dart';
import 'package:flutter_base/data/network/api_constant.dart';
import 'package:flutter_base/domain/entities/orderme_model.dart';
import 'package:flutter_base/domain/interfaces/orderme_interfaces.dart';

class OrderMeRepository implements OrderMeInterface {
  final Dio dio;

  OrderMeRepository({this.dio});

  @override
  Future<List<OrderMeModel>> getListOrderMe() async {
    try {
      final response = await dio.get(ApiConstant.ORDERME, options: await HeaderNetWorkConstant.getOptionsWithToken());
      print("List response: " + response.data.toString());
      return (response.data as List).map((e) => OrderMeModel.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e);
      throw Future.error(e.response.data.toString());
    }
  }
}
