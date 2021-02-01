import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/product/product_controller.dart';
import 'package:flutter_base/domain/entities/product_model.dart';
import 'package:get/get.dart';

class ProductView extends View {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends ViewState<ProductView, ProductController> {
  bool check = false;
  String keycolor = "";
  @override
  void initState() {
    controller.fetchListProduct();
    controller.fetchListCategory();
    controller.listProductByCategory(controller.listProduct);
    controller.listSort.clear();
    super.initState();
  }

  @override
  Widget buildPage(context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text("sản phẩm"),
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Get.back(result: controller.listProductChoosed);
                },
                child: Icon(Icons.close)),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("danh mục sản phẩm " + controller.listProduct.length.toString()),
                    GestureDetector(
                        onTap: () {
                          print(controller.listCategory);
                          controller.listSort.clear();
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    child: SingleChildScrollView(
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: controller.listCategory
                                        .map((item) => GestureDetector(
                                              onTap: () {
                                                controller.listSort.add('${item}');
                                                print(controller.listSort);
                                              },
                                              child: Card(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text('${item}'),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(9),
                                                    side: BorderSide(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      width: 1,
                                                    ),
                                                  )),
                                            ))
                                        .toList()
                                        .cast<Widget>(),
                                  ),
                                ));
                              }).then((value) {
                            controller.filtByCategory();
                            print("hihiihhhhhh");
                          });
                        },
                        child: Icon(Icons.filter_alt_outlined))
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: controller.listProductByCategory.length,
                itemBuilder: (context, index) {
                  return PdItem(index: index, listProduct1: controller.listProductByCategory);
                },
              ))
            ],
          ),
        ));
  }
}

class PdItem extends StatefulWidget {
  final int index;
  final List<ProductModel> listProduct1;
  PdItem({@required this.index, @required this.listProduct1});
  @override
  _PdItemState createState() => _PdItemState();
}

class _PdItemState extends State<PdItem> {
  bool check = false;
  ProductController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          color: check ? Colors.greenAccent : Colors.white,
          child: ListTile(
            title: Text('${widget.listProduct1[widget.index].name}'),
            trailing: Text('${widget.listProduct1[widget.index].price}'),
            onTap: () {
              setState(() {
                check = true;
              });

              if (controller.listProductChoosed.contains(controller.listProduct[widget.index])) {
                controller.listProductChoosed.removeWhere((item) => item == controller.listProduct[widget.index]);
              } else {
                controller.listProductChoosed.add(controller.listProduct[widget.index]);
              }
            },
          ),
        ));
  }
}
