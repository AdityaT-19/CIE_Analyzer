import 'package:cie_final/data/data.dart';
import 'package:cie_final/screens/cie_input.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

final subjectData = MarksDestails();

class CIESubScreen extends StatelessWidget {
  const CIESubScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("CIE Subject Select"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            GradientText(
              "Select A Subject",
              style: Theme.of(context).textTheme.displaySmall,
              colors: const [
                Colors.white,
                Color.fromARGB(255, 86, 0, 84),
              ],
            ),
            for (var sub in subjectData.data.values)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => CIEInputScreen(sub),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 85, 0, 86),
                      padding: EdgeInsets.all(10),
                    ),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    label: Text(
                      sub.subTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
