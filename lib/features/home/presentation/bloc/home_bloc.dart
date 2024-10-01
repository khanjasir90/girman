import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:girman/core/network/api_result.dart';
import 'package:girman/features/home/data/data_source/firebase.dart';
import 'package:girman/features/home/data/models/person_model.dart';
import 'package:girman/features/home/data/repository/person_repository_impl.dart';
import 'package:girman/features/home/domain/repository/person_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.personRepository,
  }): super(const HomeState()) {
    on<GetPersonData>(_onGetPersonData);
    on<SearchPersonData>(_onSearchPersonData);
  }

  final PersonRepository personRepository;

  FutureOr<void> _onGetPersonData(GetPersonData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final ApiResult<List<PersonDataModel>> result = await personRepository.getPerson();
    if(result is ApiSuccess) {
      emit(state.copyWith(personData: result.data, filteredData: result.data , status: ApiStatus.success));
    } else {
      emit(state.copyWith(status: ApiStatus.failure));
    }
  }

  FutureOr<void> _onSearchPersonData(SearchPersonData event, Emitter<HomeState> emit) {
    if(event.query.isEmpty) {
      emit(state.copyWith(personData: state.personData, status: ApiStatus.success));
    } else {
      final List<PersonDataModel> searchResult = state.personData.where((PersonDataModel person) {
        return person.firstName.toLowerCase().contains(event.query.toLowerCase()) || person.lastName.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      if(searchResult.isEmpty) {
        emit(state.copyWith(status: ApiStatus.empty));
      } else {
        emit(state.copyWith(filteredData: searchResult, status: ApiStatus.success));
      } 
    }
  }
}
