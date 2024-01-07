import 'package:flutter/material.dart';

class DefaultFloatingButton extends StatelessWidget {
  final dynamic onPressed;
  final IconData icon;
  const DefaultFloatingButton(
      {this.onPressed, this.icon = Icons.add, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPressed();
      },
      elevation: 10,
      backgroundColor: Colors.grey.shade800,
      child: Icon(
        icon,
        size: 38,
        color: Colors.white,
      ),
    );
  }
}
