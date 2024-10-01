import 'package:girman/core/network/api_result.dart';
import 'package:girman/features/home/data/models/person_model.dart';

abstract class PersonRepository {
  Future<ApiResult<List<PersonDataModel>>> getPerson();
}