import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  const ContainerBox({super.key, required this.color});
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color == 0
            ? Color.fromARGB(255, 162, 170, 173)
            : const Color.fromARGB(255, 232, 232, 232),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 10,
      width: 45,
    );
  }
}
