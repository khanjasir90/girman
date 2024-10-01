import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:girman/core/theme.dart';
import 'package:girman/features/home/data/models/person_model.dart';
import 'package:girman/features/home/presentation/widgets/button.dart';

class GirmanCardTile extends StatelessWidget {
  const GirmanCardTile({super.key, required this.personData});


  final PersonDataModel personData;

  BoxDecoration get getBoxDecoration => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
  );


  Widget get getImage => ClipOval(
      child: Image.asset(
        'assets/images/profile.png',
        width: 50,
        height: 50,
        fit: BoxFit.cover, // Ensures the image covers the entire circle
      ),
    );
  
  Widget get getLocation => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        child: Image.asset(
          'assets/images/location.png',
        ),
      ),
      const Gap(10),
      Baseline(baseline: 12, baselineType: TextBaseline.alphabetic , child: Text(personData.city)),
    ],
  );

  Widget get getPhoneNo => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/phone.png',
            ),
          ),
          const Gap(10),
          Baseline(baseline: 12, baselineType: TextBaseline.alphabetic, child: Text(personData.contactNumber)),
        ],
      ),
      const Gap(5),
      const Text('Available on Phone')
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecoration,
      margin: const EdgeInsets.symmetric(horizontal: PaddingUtils.paddingExtraLarge, vertical: PaddingUtils.paddingMedium),
      padding: const EdgeInsets.all(PaddingUtils.paddingMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getImage,
          const Gap(10),
          Text("${personData.firstName} ${personData.lastName}", style: context.bodyLarge,),
          const Gap(10),
          getLocation,
          const Gap(30),
          const Divider(thickness: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getPhoneNo,
              const Spacer(),
              GirmanButton(onPressed: () => showDetails(context),),
            ],
          )
        ],
      ),
    );
  }

  Future<void> showDetails(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Details', style: context.displaySmall,),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('First Name: ${personData.firstName}'),
              const Gap(5),
              Text('Last Name: ${personData.lastName}'),
              const Gap(5),
              Text('City: ${personData.city}'),
              const Gap(5),
              Text('Contact Number: ${personData.contactNumber}'),
              const Gap(5),
              const Text('Profile Image:'),
              const Gap(5),
              Image.asset('assets/images/profile.png'),
            ],
          ),
        );
      },
    );
  }
}