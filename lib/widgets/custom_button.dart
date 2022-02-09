import 'package:flutter/material.dart';
import 'package:svu_placement_test/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.text, this.width = 140, required this.onPressed});

  final String text;
  final double width;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: onPressed,
        label: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
