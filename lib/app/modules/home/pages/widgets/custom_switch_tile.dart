import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  final String label;
  final void Function(bool)? onChanged;
  final bool value;

  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  const CustomSwitchTile({
    super.key,
    required this.label,
    this.onChanged,
    required this.value,
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
      child: SwitchListTile(
        title: Text(label),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
