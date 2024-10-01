import 'package:girman/core/network/api_result.dart';
import 'package:girman/features/home/data/data_source/firebase.dart';
import 'package:girman/features/home/data/models/person_model.dart';
import 'package:girman/features/home/domain/entities/person_entity.dart';
import 'package:girman/features/home/domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {

  const PersonRepositoryImpl({required this.firseBaseDataSource});
  
  final FirseBaseDataSource firseBaseDataSource;


  @override
  Future<ApiResult<List<PersonDataModel>>> getPerson() async {
    try {
      final Future<List<PersonDataModel>> response =  firseBaseDataSource.getHomeData();
      return ApiSuccess(data: await response);
    } catch (e) {
      return ApiError(errorMessage: e.toString());
    }
  }

}