import 'package:dio/dio.dart';
import 'package:flutter_base/data/network/api_constant.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/entities/setting_model.dart';
import 'package:flutter_base/domain/interfaces/order_interfaces.dart';

class OrderRepository implements OrderInterface {
  final Dio dio;

  OrderRepository({this.dio});

  @override
  Future<ProfileModel> getListProfile() async {
    try {
      final response = await dio.get(ApiConstant.PROFILE, options: await HeaderNetWorkConstant.getOptionsWithToken());
      print("data: ${response.data}");
      // print("1111111111111${ProfileModel.fromJson(response.data)}");
      return ProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      throw Future.error(e.response.data.toString());
    }
  }

  @override
  Future<SettingModel> getSetting() async {
    try {
      final response = await dio.get(ApiConstant.SETTING, options: await HeaderNetWorkConstant.getOptionsWithToken());
      return SettingModel.fromJson(response.data);
    } on DioError catch (e) {
      return Future.error(e.response.data);
    }
  }

  @override
  Future postProfile(String bankName, String branchName, String bankOwnerAccount, String bankAccount, String phone, String facebookNickname,
      String nicknames) async {
    // TODO: implement postProfile
    try {
      await dio.put(ApiConstant.UPDATE,
          options: await HeaderNetWorkConstant.getOptionsWithToken(),
          queryParameters: ({
            'bank_name': bankName,
            'branch_name': branchName,
            'bank_owner_account': bankOwnerAccount,
            'bank_account': bankAccount,
            'phone': phone,
            'facebook_nickname': facebookNickname,
            'nicknames': nicknames
          }));
    } catch (e) {
      print(e);
      return Future.error(e.response.data);
    }
  }
}
