import 'package:flutter/material.dart';

class elevButton extends StatelessWidget {
  elevButton(this.label, {super.key});
  final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 85, 0, 86)),
      icon: const Icon(Icons.arrow_forward),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
