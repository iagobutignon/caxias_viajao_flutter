import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(45)),
        maximumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(45)),
      ),
      child: Text(label),
    );
  }
}
