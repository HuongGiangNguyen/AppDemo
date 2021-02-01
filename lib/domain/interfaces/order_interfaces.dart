import 'package:flutter/cupertino.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/entities/setting_model.dart';

abstract class OrderInterface {
  Future<ProfileModel> getListProfile();
  Future postProfile(@required String bankName, @required String branchName, @required String bankOwnerAccount,
      @required String bankAccount, @required String phone, @required String facebookNickname, @required String nicknames);
  Future<SettingModel> getSetting();
}
