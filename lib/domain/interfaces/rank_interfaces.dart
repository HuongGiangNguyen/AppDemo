import 'package:flutter_base/domain/entities/rank_model.dart';

abstract class RankInterface {
  Future<List<This>> getListRank();
}
