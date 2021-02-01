import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/login/login_controller.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class Login extends View {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ViewState<Login, LoginController> {

  Future<void> _scanQuery() async {
    final tempResultBarCode = await FlutterBarcodeScanner.scanBarcode(
        '#004297', 'Cancel', true, ScanMode.QR);
    controller.resultBarcode(tempResultBarCode);
    return;
  }

  @override
  void initState() {
    super.initState();
    //controller.checkIfIsLogged();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget buildPage(context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Đăng nhập'),
        ),
        body: Center(
          child: CupertinoButton(
            color: Colors.blue,
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await _scanQuery();
              controller.fetchDataFromApi(action: () {
                Get.offNamed(Routes.HOME);
              });
            },
          ),
        ));
  }
}
