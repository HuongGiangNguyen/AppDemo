import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/order/order_controller.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OrderView extends View {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends ViewState<OrderView, OrderController> {
  TextEditingController _controller;
  TextEditingController _settingController;
  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
    _settingController = new TextEditingController();
    // print("=============================");
    // print(controller);
    controller.fetchListProfile();

    // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    controller.fetchListSetting();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget buildPage(context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              title: Text("Đặt hàng"),
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.close))),
          body: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text("nick mua hang"),
                  trailing: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Obx(() => Column(
                                  children: controller.profile.value.nicknames
                                      .map((text) => RadioListTile(
                                            groupValue: controller.radioGroupValue.value,
                                            title: Text('$text'),
                                            value: text,
                                            onChanged: (val) {
                                              _controller.text = '$val';
                                              controller.radioGroupValue.value = '$val';
                                              controller.isvisibleTextfieldNick(true);
                                            },
                                          ))
                                      .toList(),
                                ));
                          },
                        );
                      },
                      child: Icon(Icons.playlist_add)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Visibility(
                  // Get.find(),
                  visible: controller.isvisibleTextfieldNick.value,
                  // visible: true,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff7C4DFF),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _controller,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("phuong thuc thanh toan"),
                  trailing: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Obx(() => SingleChildScrollView(
                                  child: Column(
                                    children: controller.listMethod
                                        .map((text) => RadioListTile(
                                              groupValue: controller.radioGroupValue.value,
                                              title: Text('$text'),
                                              value: text,
                                              onChanged: (val) {
                                                controller.radioGroupValue.value = '$val';
                                                _settingController.text = '$val';
                                                controller.isvisibleTextfieldSetting(true);
                                              },
                                            ))
                                        .toList(),
                                  ),
                                ));
                          },
                        );
                      },
                      child: Icon(Icons.playlist_add)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Visibility(
                  // Get.find(),
                  visible: controller.isvisibleTextfieldSetting.value,
                  // visible: true,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff7C4DFF),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _settingController,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("san pham da chon"),
                  trailing: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PRODUCT).then((value) => controller.listSelected.addAll(value));
                      },
                      child: Icon(Icons.playlist_add)),
                ),
              ),
              controller.listSelected.length != 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),

                      // visible: true,
                      child: Container(
                        height: 100,
                        child: ListView.builder(
                          itemCount: controller.listSelected.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => Card(
                                child: ListTile(
                                  title: Text('${controller.listSelected[index].name}'),
                                  trailing: Text('${controller.listSelected[index].price}'),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Container(),
              Card(
                  child: TextField(
                // obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Ghi chu"),
              )),
            ],
          ),
          bottomSheet: Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(20),
              border: Border.all(color: Colors.black.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 100,
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "tổng tiền",
                          style: TextStyle(color: Colors.blue),
                        ),
                        Text(
                          '${controller.getPrice(controller.listSelected)}đ',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                title: new Text("đặt hàng thành công"),
                                // content: new Text("Hey! I'm Coflutter!"),

                                actions: <Widget>[
                                  FlatButton(
                                    color: Colors.blue,
                                    child: Text('đóng'),
                                    onPressed: () {
                                      Get.toNamed(Routes.HOME);
                                    },
                                  )
                                ],
                              ));
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "Xác nhận",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
