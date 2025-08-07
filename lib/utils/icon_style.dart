import 'package:flutter/material.dart';

class TransparentIcon extends StatelessWidget {
  TransparentIcon({super.key, required this.icon, required this.onPressed});
  IconData icon;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
