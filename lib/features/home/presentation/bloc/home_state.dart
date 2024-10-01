part of 'home_bloc.dart';

enum ApiStatus {
  initial,
  loading,
  success,
  failure,
  empty,
}

extension ApiStatusExt on ApiStatus {
  bool get isInitial => this == ApiStatus.initial;
  bool get isLoading => this == ApiStatus.loading;
  bool get isSuccess => this == ApiStatus.success;
  bool get isFailure => this == ApiStatus.failure;
  bool get isEmpty => this == ApiStatus.empty;
}

class HomeState extends Equatable {
  const HomeState({
    this.personData = const <PersonDataModel>[],
    this.filteredData = const <PersonDataModel>[],
    this.status = ApiStatus.initial,
  });


  final List<PersonDataModel> personData;
  final List<PersonDataModel> filteredData;
  final ApiStatus status;

  
  @override
  List<Object> get props => [
    personData,
    filteredData,
    status,
  ];

  HomeState copyWith({
    List<PersonDataModel>? personData,
    List<PersonDataModel>? filteredData,
    ApiStatus? status,
  }) {
    return HomeState(
      personData: personData ?? this.personData,
      filteredData: filteredData ?? this.filteredData,
      status: status ?? this.status,
    );
  }
}

