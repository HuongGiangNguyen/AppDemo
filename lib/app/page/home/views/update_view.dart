import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:get/get.dart';

class UpdateView extends View {
  @override
  _UpdateViewState createState() => _UpdateViewState();
}

class _UpdateViewState extends ViewState<UpdateView, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.fetchProfile();
  }

  @override
  void dispose() {
    super.dispose();
  }

  update(String s, int type) {
    switch (type) {
      case 1:
        controller.profileMod.value.bankName = s;
        break;
      case 2:
        controller.profileMod.value.branchName = s;
        break;
      case 3:
        controller.profileMod.value.bankOwnerAccount = s;
        break;
      case 4:
        controller.profileMod.value.bankAccount = s;
        break;
      case 5:
        controller.profileMod.value.phone = s;
        break;
      case 6:
        controller.profileMod.value.facebookNickname = s;
        break;
    }
  }

  Widget textformfield(String s, String s1, int type) {
    return TextFormField(
      initialValue: s,
      onChanged: (str) => {update(str, type)},
      decoration: InputDecoration(border: OutlineInputBorder(), labelText: s1),
    );
  }

  String lstToString(List<String> lst) {
    String nickNames = "";
    for (int i = 0; i < lst.length; i++) {
      nickNames += lst[i] + ",";
    }
    return nickNames;
  }

  @override
  Widget buildPage(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
            title: Text("chỉnh sửa thông tin"),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 50,
                height: 50,
                child: Icon(Icons.cancel),
              ),
            )),
        body: controller.profileMod.value == null
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: textformfield(controller.profileMod.value.bankName, "Tên ngân hàng", 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: textformfield(controller.profileMod.value.branchName, "Chi nhánh ngân hàng", 2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: textformfield(controller.profileMod.value.bankOwnerAccount, "Tên chủ tài khoản", 3),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: textformfield(controller.profileMod.value.bankAccount, "Tài khoản", 4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: textformfield(controller.profileMod.value.phone, "Số điện thoại", 5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: textformfield(controller.profileMod.value.facebookNickname, "Facebook link", 6),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: TextFormField(
                        initialValue: lstToString(controller.profileMod.value.nicknames),
                        onChanged: (str) {
                          controller.profileMod.value.nicknames = str.split(",");
                        },
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'danh sách nick mua hàng'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: RaisedButton(
                          color: Colors.blue,
                          onPressed: () async {
                            await controller.updateProfile().then((value) => Get.back(result: controller.profileMod));
                            controller.fetchProfile();
                            print("updated: " + controller.profileMod.value.toString());
                          },
                          child: Text('Xác nhận'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
