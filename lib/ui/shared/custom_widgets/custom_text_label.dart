import 'package:flutter/material.dart';
import 'package:perfume_composition/model/app_colors.dart';

class CustomTextLabel extends StatelessWidget {
  final String text;

  const CustomTextLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        color: AppColors.secondMainAppColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(text,
          style: TextStyle(
              color: AppColors.mainScreenBackgroundColor,fontSize: 20)),
    );
  }
}
