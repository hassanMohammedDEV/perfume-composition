import 'package:flutter/material.dart';
import 'package:perfume_composition/model/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const CustomElevatedButton(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.mainAppColor),
            elevation: const MaterialStatePropertyAll(1),
            minimumSize:
                const MaterialStatePropertyAll(Size(double.infinity, 50)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)))),
        onPressed: onTap as void Function()?,
        child: Text(
          text,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20),
        ));
  }
}
