import 'package:flutter_base/domain/entities/shop_model.dart';

abstract class ShopInterface {
  Future<List<ShopModel>> getListShop();

}
