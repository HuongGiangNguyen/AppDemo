import 'package:flutter_base/domain/entities/orderme_model.dart';

abstract class OrderMeInterface {
  Future<List<OrderMeModel>> getListOrderMe();
}
