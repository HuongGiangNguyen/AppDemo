import 'package:dio/dio.dart';
import 'package:flutter_base/data/network/api_constant.dart';
import 'package:flutter_base/domain/entities/rank_model.dart';
import 'package:flutter_base/domain/interfaces/rank_interfaces.dart';

class RankReposistory implements RankInterface {
  final Dio dio;
  RankReposistory({this.dio});
  @override
  Future<List<This>> getListRank() async {
    try {
      Response response = await dio.get(ApiConstant.RANK, options: await HeaderNetWorkConstant.getOptionsWithToken());
      return (response.data["this"] as List).map((e) => This.fromJson(e)).toList();
    } on DioError catch (e) {
      throw Future.error(e.response.data.toString());
    }
  }
}
