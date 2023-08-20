import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CGPAop extends StatelessWidget {
  const CGPAop(this.gpa, {super.key});
  final List<double> gpa;
  @override
  Widget build(BuildContext context) {
    double x = 0;
    for (var g in gpa) {
      x += g;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("CGPA"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GradientText(
            "Your CGPA is ${(x / gpa.length).toStringAsFixed(2)} ",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(),
            textAlign: TextAlign.center,
            gradientDirection: GradientDirection.btt,
            colors: const [
              Colors.white,
              Color.fromARGB(255, 86, 0, 84),
            ],
          ),
        ),
      ),
    );
  }
}
