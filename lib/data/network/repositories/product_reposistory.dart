import 'package:dio/dio.dart';
import 'package:flutter_base/data/network/api_constant.dart';
import 'package:flutter_base/domain/entities/product_model.dart';
import 'package:flutter_base/domain/interfaces/product_interfaces.dart';

class ProductReposistory implements ProductInterface {
  final Dio dio;
  ProductReposistory({this.dio});
  @override
  Future<List<ProductModel>> getListProduct() async {
    try {
      Response response = await dio.get(ApiConstant.PRODUCTFORUSER, options: await HeaderNetWorkConstant.getOptionsWithToken());
      return (response.data as List).map((value) => ProductModel.fromJson(value)).toList();
    } on DioError catch (e) {
      throw Future.error(e.response.data);
    }
  }

  @override
  Future<List<String>> getListCategory() async {
    try {
      Response response = await dio.get(ApiConstant.CATEGORY, options: await HeaderNetWorkConstant.getOptionsWithToken());
      return (response.data as List<dynamic>).map((e) => e.toString()).toList();
    } on DioError catch (e) {
      throw Future.error(e.response.data);
    }
  }
}
