import 'package:flutter/material.dart';

class CustomMultilineField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  const CustomMultilineField({
    super.key,
    required this.label,
    this.controller,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        marginLeft,
        marginTop,
        marginRight,
        marginBottom,
      ),
      child: TextField(
        controller: controller,
        minLines: 4,
        maxLines: 10,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}