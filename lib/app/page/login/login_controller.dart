import 'package:dio/dio.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/data/storage/hive_storage.dart';

import 'package:get/get.dart';

class LoginController extends Controller {
  LoginController();

  /// inject repo abstraction dependency

  /// create a reactive status from request with initial value = loading
  final resultBarcode = Rx<String>();
  // final accessToken = Rx<AccessToken>();

  /// When the controller is initialized, make the http request

  // checkIfIsLogged() async {
  //   FacebookAuth.instance.isLogged.then((accessToken) {
  //     if (accessToken != null) {
  //       // now you can call to  FacebookAuth.instance.getUserData();
  //       // final userData = await FacebookAuth.instance.getUserData(fields:"email,birthday");
  //       this.accessToken(accessToken);
  //       this.status(Status.success);
  //     }
  //   });
  // }

  /// fetch cases from Api
  Future<void> fetchDataFromApi({VoidCallback action}) async {
    /// When the repository returns the value, change the status to success,
    /// and fill in "cases"
    status(Status.loading);
    // if (accessToken.value == null) {
    //   final result = await FacebookAuth.instance.login();
    //   // final result = await FacebookAuth.instance.login(permissions:['email','user_birthday']);
    //   accessToken(result);
    // }
    final token = resultBarcode.value.split(';');
    // await loginInterface.login(token[1]).then(
    //   (data) async {
    //
    //   },
    await HiveStorage.persistToken(token[1]);
    print(token[1]);
    status(Status.success);
    action?.call();

    /// In case of error, print the error and change the status
    /// to Status.error
    // onError: (err) {
    //   print("$err");
    //   status(Status.error);
    // },
    // );
  }
}
