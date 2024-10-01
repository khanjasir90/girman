part of 'home_bloc.dart';

sealed class HomeEvent{}

class GetPersonData extends HomeEvent{}

class SearchPersonData extends HomeEvent{
  final String query;

  SearchPersonData(this.query);
}
