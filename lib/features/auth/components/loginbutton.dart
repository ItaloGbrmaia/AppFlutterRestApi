import 'package:flutter/material.dart';

class ResgisterButton extends StatelessWidget {
  const ResgisterButton({
    super.key,
    required this.on_pressed,
    required this.text,
  });

  final Function on_pressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
      child: SizedBox(
        width: 250,
        height: 50,
        child: ElevatedButton(
          onPressed: () => on_pressed(),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              side: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
