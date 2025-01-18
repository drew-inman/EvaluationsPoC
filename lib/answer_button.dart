import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.buttonText,
    required this.buttonAction,
    required this.isSelected
  });

  final String buttonText;
  final bool isSelected;

  final void Function() buttonAction;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: buttonAction,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.lightBlue : const Color.fromRGBO(33, 150, 243, .5),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
