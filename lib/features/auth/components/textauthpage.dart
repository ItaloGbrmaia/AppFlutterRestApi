import 'package:flutter/material.dart';

class TextAuthPage extends StatelessWidget {
  const TextAuthPage({
    super.key,
    required this.text,
    required this.padding,
  });

  final Widget text;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: 250,
        child: text,
      ),
    );
  }
}
