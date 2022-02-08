import 'package:flutter/material.dart';
import 'package:svu_placement_test/constants.dart';

class CustomTextFromField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController textEditingController;
  final void Function(String?)? onSaved;
  final void Function(String?)? onFieldSubmitted;

  const CustomTextFromField({
    required this.label,
    required this.hintText,
    required this.textEditingController,
    required this.onSaved,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      style: const TextStyle(
        color: Colors.black45,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: kHintTextStyle,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: kLabelTextStyle,
        focusedBorder: kOutlineInputBorder,
        enabledBorder: kOutlineInputBorder,
        errorBorder: kOutlineInputBorder,
        focusedErrorBorder: kFocusedErrorBorder,
      ),
      validator: (String? val) =>
          val!.isEmpty ? '$label should not be empty' : null,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
