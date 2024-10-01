import 'package:flutter/material.dart';
import 'package:girman/core/theme.dart';

class GirmanButton extends StatelessWidget {
  const GirmanButton({super.key, required this.onPressed});

  final Function() onPressed;

  BoxDecoration get getBoxDecoration => const BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(PaddingUtils.paddingSmall),
        decoration: getBoxDecoration,
        width: 100,
        height: 34,
        child: Center(child: Text('Details', style: context.labelLarge.copyWith(color: Colors.white),)),
      ),
    );
  }
}