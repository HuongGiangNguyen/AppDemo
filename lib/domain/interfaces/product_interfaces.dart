import 'package:flutter_base/domain/entities/product_model.dart';

abstract class ProductInterface {
  Future<List<ProductModel>> getListProduct();
  Future<List<String>> getListCategory();
}
