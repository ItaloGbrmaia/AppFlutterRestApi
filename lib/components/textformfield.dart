import 'dart:ffi';

import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal({
    super.key,
    required this.Controller,
    required this.Validate,
    required this.text,
    required this.icon,
  });

  final TextEditingController Controller;
  final String? Function(String?) Validate;
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 17.0, right: 17.0, top: 0, bottom: 0),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: Colors.grey),
            borderRadius: BorderRadius.circular(16.0),
          ),
          prefixIcon: icon,
          hintText: text,
          filled: true,
          fillColor: const Color.fromARGB(255, 185, 183, 180).withOpacity(0.4),
        ),
        controller: Controller,
        keyboardType: TextInputType.emailAddress,
        validator: Validate,
      ),
    );
  }
}
