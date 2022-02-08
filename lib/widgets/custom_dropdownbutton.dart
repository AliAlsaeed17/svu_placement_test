import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDropdownButton extends StatelessWidget {
  final String label;
  final String hintText;
  final List<String> options;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;

  const CustomDropdownButton({
    required this.label,
    required this.hintText,
    required this.options,
    required this.onChanged,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      items: options
          .map((level) => DropdownMenuItem<String>(
                child: Text(level),
                value: level,
              ))
          .toList(),
      style: const TextStyle(color: kInputTextColor, fontSize: kInputTextSize),
      iconSize: kIconSize,
      iconEnabledColor: kPrimaryColor,
      iconDisabledColor: kPrimaryColor,
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
      offset: const Offset(0, -15),
      dropdownMaxHeight: 160,
      dropdownPadding: const EdgeInsets.all(12),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      validator: (String? val) {
        if (val == null) {
          return '$label is not selected';
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
