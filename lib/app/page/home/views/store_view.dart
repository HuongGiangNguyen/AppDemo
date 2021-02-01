import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:get/get.dart';

class StoreView extends View {
  @override
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends ViewState<StoreView, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.fetchListShop();
    controller.fetchProfile();
    controller.fetchListrank();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget buildPage(context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('Cửa hàng'),
                ),
                body: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.ORDER);
                  },
                  child: ListView.builder(
                      itemCount: controller.listShop.length,
                      itemBuilder: (context, index) {
                        return Text(controller.listShop[index].name);
                      }),
                )),
            loading(status: controller.status.value, context: context)
          ],
        ));
  }
}
