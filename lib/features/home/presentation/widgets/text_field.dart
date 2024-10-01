import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:girman/core/theme.dart';
import 'package:girman/features/home/presentation/bloc/home_bloc.dart';

class GirmanTextField extends StatelessWidget {
  GirmanTextField({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingUtils.paddingLarge),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
        ),
        onChanged: (String value) {
          context.read<HomeBloc>().add(SearchPersonData(value));
        },
      ),
    );
  }
}
