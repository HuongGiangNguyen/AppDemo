import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/product_model.dart';
import 'package:flutter_base/domain/interfaces/product_interfaces.dart';
import 'package:get/get.dart';

class ProductController extends Controller {
  ProductController({this.productInterface});

  final ProductInterface productInterface;
  final listProduct = List<ProductModel>().obs;
  final listSort = List<String>().obs;
  final listProductByCategory = List<ProductModel>().obs;
  final listProduct1 = List<ProductModel>().obs;
  final listCategory = List<String>().obs;
  final listProductChoosed = List<ProductModel>().obs;

  Future<void> fetchListProduct({VoidCallback callback}) async {
    status(Status.loading);
    productInterface.getListProduct().then(
      (data) {
        listProduct.clear();
        listProduct.addAll(data);
        listProduct1.clear();
        listProduct1.addAll(data);
        status(Status.success);
        callback?.call();
      },
      onError: (err) {
        status(Status.error);
      },
    );
  }

  Future<void> fetchListCategory({VoidCallback callback}) async {
    status(Status.loading);
    productInterface.getListCategory().then(
      (data) {
        listCategory.clear();
        listCategory.addAll(data);
        status(Status.success);
        callback?.call();
      },
      onError: (err) {
        status(Status.error);
      },
    );
  }

  filtByCategory() {
    // print(listProduct.length);
    if (listSort.length > 0) {
      listProductByCategory.clear();
      // print(listProduct.length);
      for (int i = 0; i < listProduct1.length; i++) {
        // print(listProduct.length);
        // print("list sort:");
        // print(listSort);
        // print(listProduct1[i].categoryName);
        if (listSort.contains(listProduct1[i].categoryName)) {
          listProductByCategory.add(listProduct1[i]);
        }
      }
      ;
      // print(listProductByCategory);
    } else {
      listProductByCategory.clear();
      listProductByCategory.addAll(listProduct1);
    }
  }
}
