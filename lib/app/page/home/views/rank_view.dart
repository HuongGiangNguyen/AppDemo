import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:get/get.dart';

class RankView extends View {
  @override
  _RankViewState createState() => _RankViewState();
}

class _RankViewState extends ViewState<RankView, HomeController> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    controller.fetchListrank();
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
                title: Text("Xep hang"),
              ),
              body: Container(
                child: ListView.builder(
                    itemCount: controller.listRank.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Container(
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '${controller.listRank[index].ranking}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 200.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text(controller.listRank[index].name), Text('${controller.listRank[index].total}')],
                              ),
                            ),
                          ],
                        ),
                      ));
                    }),
              ),
            ),
            loading(status: controller.status.value, context: context)
          ],
        ));
  }
}
