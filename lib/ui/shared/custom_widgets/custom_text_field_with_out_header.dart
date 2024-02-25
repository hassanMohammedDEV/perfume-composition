import 'package:flutter/material.dart';

class CustomTextFieldWithOutHeader extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final IconData? iconData;
  final bool isPassword;
  final int? maxLines;
  final Function? validator;

  const CustomTextFieldWithOutHeader({
    Key? key, required this.hintText,this.keyboardType,
    this.iconData, this.isPassword = false,this.validator,
    this.maxLines, required this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
        keyboardType: keyboardType,
        controller: controller,
        validator: validator as String? Function(String?)? ?? ((_)=> null),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines,
        obscureText: isPassword?  true : false,
        decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey,fontSize: 15),
            suffixIcon: Icon(iconData, color: Colors.grey,)
        ));
  }

}