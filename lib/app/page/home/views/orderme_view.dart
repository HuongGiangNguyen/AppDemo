import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:get/get.dart';

class OrderMeView extends View {
  @override
  _OrderMeViewState createState() => _OrderMeViewState();
}

class _OrderMeViewState extends ViewState<OrderMeView, HomeController> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    controller.fetchOrderMe();
    // print("Order me view: " + controller.listOrderMe.length.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget buildPage(context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Đơn hàng"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.filter_alt_outlined),
                    onPressed: () {},
                  )
                ],
              ),
              body: Container(
                child: ListView.builder(
                    itemCount: controller.listShop.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Row(
                        children: [Text("số hiệu đơn hàng"), Text('${controller.listOrderMe[index].orderNo}')],
                      ));
                    }),
              ),
            ),
            loading(status: controller.status.value, context: context)
          ],
        ));
  }
}
