import 'package:flutter_base/domain/entities/case_model.dart';

abstract class HomeInterface {
  Future<CasesModel> getCases();
}
