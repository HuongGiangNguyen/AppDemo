import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:flutter_base/app/widgets/colors.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:get/get.dart';

class ProfileView extends View {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends ViewState<ProfileView, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.fetchProfile();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget buildPage(context) {
    var lenPhone;
    controller.profileMod.value.phone == null ? lenPhone = 0 : lenPhone = controller.profileMod.value.phone.length;
    var lenBank;
    controller.profileMod.value.bankAccount == null ? lenBank = 0 : lenBank = controller.profileMod.value.bankAccount.length;
    final String endBankAccount =
        controller.profileMod.value.bankAccount != null ? controller.profileMod.value.bankAccount.substring((lenBank - 3), lenBank) : "";
    final String endPhoneNumber =
        controller.profileMod.value.phone != null ? controller.profileMod.value.phone.substring((lenPhone - 3), lenPhone) : "";
    double width = MediaQuery.of(context).size.width;
    return Obx(() => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Cá nhân"),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.UPDATE);
                      print("=================");
                      print(controller.profileMod);
                    },
                    child: Container(width: 50, height: 50, child: Icon(Icons.edit)),
                  )
                ],
              ),
              body: controller.profileMod.value.avatar == null
                  ? Container()
                  : Container(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Container(
                            width: width - 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: peacockBlue,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                                  child: Image.network(controller.profileMod.value.avatar),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(height: 30, child: textInformation("Name: ")),
                                        Container(height: 30, child: textInformation("Số điện thoại: ")),
                                        Container(height: 90, child: textInformation("Nick Name: ")),
                                        Container(height: 30, child: textInformation("Facebook link: ")),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(height: 30, child: textInformation(controller.profileMod.value.name)),
                                        Container(height: 30, child: textInformation("*******" + endPhoneNumber)),
                                        Container(
                                            height: 90,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: controller.profileMod.value.nicknames == null
                                                    ? []
                                                    : controller.profileMod.value.nicknames.map((e) {
                                                        return textInformation(e);
                                                      }).toList(),
                                              ),
                                            )),
                                        Container(height: 30, child: Icon(Icons.link, color: peacockBlue)),
                                      ],
                                    ),
                                  )
                                ]),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 20),
                          child: Container(
                            width: width - 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: peacockBlue,
                                width: 2,
                              ),
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 30, child: textInformation("Tên ngân hàng: ")),
                                    Container(height: 30, child: textInformation("Chi nhánh ngân hàng: ")),
                                    Container(height: 30, child: textInformation("Tên chủ tài khoản: ")),
                                    Container(height: 30, child: textInformation("tài khoản: ")),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 30, child: textInformation(controller.profileMod.value.bankName)),
                                    Container(height: 30, child: textInformation(controller.profileMod.value.branchName)),
                                    Container(height: 30, child: textInformation(controller.profileMod.value.bankOwnerAccount)),
                                    Container(height: 40, width: width / 2 - 40, child: textInformation("***********" + endBankAccount)),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ],
                    )),
            ),
            loading(status: controller.status.value, context: context)
          ],
        ));
  }
}

Widget textInformation(String text) {
  return Text(text,
      textAlign: TextAlign.start,
      maxLines: 2,
      style: TextStyle(
        fontSize: 15,
        color: peacockBlue,
      ));
}
