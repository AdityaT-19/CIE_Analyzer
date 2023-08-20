import 'package:cie_final/models/details.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CIEOutputScreen extends StatefulWidget {
  const CIEOutputScreen(this.sub, this.mes, {super.key});
  final Subject sub;
  final String mes;
  @override
  State<StatefulWidget> createState() {
    return _CIEOutputScreenBu();
  }
}

class _CIEOutputScreenBu extends State<CIEOutputScreen> {
  Grades? _grade;
  bool flag = false;
  Widget dispMes(Grades g) => Expanded(
        child: Column(
          children: [
            GradientText(
              widget.sub.reqSeeMes(_grade!),
              style: Theme.of(context).textTheme.displaySmall,
              gradientType: GradientType.linear,
              gradientDirection: GradientDirection.ttb,
              colors: const [Colors.white, Color.fromARGB(219, 189, 135, 216)],
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("CIE Analysis"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 34,
              ),
              GradientText(
                widget.mes,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
                colors: const [
                  Colors.white,
                  Color.fromARGB(255, 86, 0, 84),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                  ),
                  children: [
                    for (var grade in Grades.values)
                      if (grade != Grades.F)
                        RadioListTile<Grades>(
                          title: Text(
                            grade.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          value: grade,
                          groupValue: _grade,
                          onChanged: (Grades? g) {
                            setState(
                              () {
                                _grade = g;
                                flag = true;
                              },
                            );
                          },
                        ),
                  ],
                ),
              ),
              if (flag) dispMes(_grade!)
            ],
          ),
        ),
      ),
    );
  }
}
