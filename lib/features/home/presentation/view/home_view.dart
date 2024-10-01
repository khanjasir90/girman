import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:girman/core/theme.dart';
import 'package:girman/features/home/presentation/bloc/home_bloc.dart';
import 'package:girman/features/home/presentation/widgets/card_tile.dart';
import 'package:girman/features/home/presentation/widgets/dropdown_button.dart';
import 'package:girman/features/home/presentation/widgets/text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetPersonData());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: PaddingUtils.paddingSmall),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          GirmanDropDownButton(),
        ],
      ),
      elevation: 5,
      backgroundColor: Colors.white,
    );
  }

  final BoxDecoration _backgroundDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white,
        Color(0xFFb1cbff), // Hex color #b1cbff
      ],
    ),
  );

  Widget get _buildAppHomeLogo {
    return SizedBox(
      child: Image.asset(
        'assets/images/home_image.png',
      ),
    );
  }

  get _buildListView {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status.isFailure) {
          return const Center(
            child: Text('Failed to fetch data'),
          );
        } else if (state.status.isEmpty) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/not_found.png',
                ),
                const Gap(10),
                const Text('No data found'),
              ],
            ),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filteredData.length,
            itemBuilder: (context, index) {
              return GirmanCardTile(personData: state.filteredData[index],);
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: _backgroundDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Gap(100),
            _buildAppHomeLogo,
            const Gap(20),
            GirmanTextField(),
            const Gap(15),
            Flexible(
              child: _buildListView,
            )
          ],
        ),
      ),
    );
  }
}
