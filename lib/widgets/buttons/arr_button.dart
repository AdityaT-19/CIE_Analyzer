import 'package:flutter/material.dart';

class arrButton extends StatelessWidget {
  const arrButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      color: Color.fromARGB(255, 193, 78, 195),
      alignment: Alignment.topLeft,
      iconSize: 55,
      icon: const Icon(Icons.arrow_back_sharp),
    );
  }
}
