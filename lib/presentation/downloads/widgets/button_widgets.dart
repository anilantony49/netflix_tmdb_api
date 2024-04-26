import 'package:flutter/material.dart';

class CustomizeButton extends StatelessWidget {
  final Color buttonColor;
  final Color buttonTextColor;
  final String buttonText;
  final EdgeInsetsGeometry padding;
  const CustomizeButton(
      {super.key,
      required this.buttonColor,
      required this.buttonText,
      required this.buttonTextColor,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: buttonColor,
        onPressed: () {},
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: buttonTextColor,
          ),
        ),
      ),
    );
  }
}
