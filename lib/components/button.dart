import 'package:flutter/material.dart';

// ignore: camel_case_types
class button extends StatelessWidget {
  const button({
    super.key,
    required this.color,
    required this.text,
    this.width = 160,
    this.heigth = 30,
    required this.onPressed,
    required this.foregroundColor,
  });

  final Color color;
  final Function onPressed;
  final Text text;
  final double width;
  final double heigth;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0, top: 10, bottom: 0),
      child: Center(
        child: Container(
          width: width,
          height: heigth,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: foregroundColor,
                backgroundColor: color,
                elevation: 0),
            child: text,
            onPressed: () => onPressed(),
          ),
        ),
      ),
    );
  }
}
