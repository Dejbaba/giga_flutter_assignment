import 'package:flutter/material.dart';
import 'package:flutterassignment/app_constants.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final Function(dynamic)? onChanged;
  final bool enabled;
  final VoidCallback? onTap;
  const MyTextField({Key? key, this.enabled = true, this.onTap, required this.hintText, this.suffixIcon, required this.controller, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        enabled: enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
          validator: validate,
          onChanged: onChanged,
          decoration:
          InputDecoration(
              hintText: hintText ?? 'Country',
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400
            ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: BoxConstraints(
              minWidth: 30,
              minHeight: 30,
            ),
          )
      ),
    );
  }

  String? validate(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return AppConstants.emptyTextField;
      }
    } else
      return null;

    return null;
  }
}
