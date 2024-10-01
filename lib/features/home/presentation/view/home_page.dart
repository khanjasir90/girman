import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:girman/features/home/data/data_source/firebase.dart';
import 'package:girman/features/home/data/repository/person_repository_impl.dart';
import 'package:girman/features/home/presentation/bloc/home_bloc.dart';
import 'package:girman/features/home/presentation/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(personRepository: PersonRepositoryImpl(firseBaseDataSource: FirseBaseDataSource())),
      child: const HomeView(),
    );
  }
}
