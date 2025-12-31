import 'package:flutter/material.dart';

typedef OnDigitClick = void Function(String);

class CalculateButton extends StatelessWidget {
  final String text;
  final OnDigitClick onBTNClick;

  const CalculateButton({
    super.key,
    required this.text,
    required this.onBTNClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () {
            onBTNClick(text);
          },
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
