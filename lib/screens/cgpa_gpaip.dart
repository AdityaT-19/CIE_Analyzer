import 'package:cie_final/screens/cgpa_op.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CGPAipScreen extends StatefulWidget {
  CGPAipScreen(this.semno, {super.key});
  final int semno;
  @override
  State<StatefulWidget> createState() {
    return _CGPAipScreenBu();
  }
}

class _CGPAipScreenBu extends State<CGPAipScreen> {
  late List<bool> validate;
  late List<String?> eMes;
  late List<double?> val;
  late List<double> gpa;
  late List<TextEditingController> txtContL;
  void initState() {
    txtContL = [
      for (var i = 0; i < widget.semno; i++) TextEditingController(),
    ];
    validate = [
      for (var i = 0; i < widget.semno; i++) false,
    ];
    eMes = [
      for (var i = 0; i < widget.semno; i++) null,
    ];
    val = [
      for (var i = 0; i < widget.semno; i++) null,
    ];
    gpa = [];
    super.initState();
  }

  String? errMes(int e, double? val) {
    validate[e] = val == null || val.isNegative || val > 10 || val < 0;
    if (validate[e]) {
      if (val == null) {
        return "Can't be EMPTY!!!";
      } else {
        return "INVALID Value!!!";
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("GPA Input"),
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
              "Enter the GPA  : ",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(),
              textAlign: TextAlign.center,
              colors: const [
                Colors.white,
                Color.fromARGB(255, 86, 0, 84),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            for (var i = 0; i < widget.semno; i++)
              TextField(
                controller: txtContL[i],
                keyboardType: TextInputType.number,
                maxLength: 4,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
                decoration: InputDecoration(
                  label: Text(
                    "Enter the GPA of semester ${i + 1} : ",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  errorText: eMes[i],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      val[i] = double.tryParse(value);
                      eMes[i] = errMes(i, val[i]);
                    },
                  );
                },
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(
                        () {
                          bool check = true;
                          for (var i = 0; i < widget.semno; i++) {
                            eMes[i] = errMes(i, val[i]);
                            if (eMes[i] != null) {
                              check = false;
                            }
                          }
                          if (check) {
                            for (var i = 0; i < widget.semno; i++) {
                              gpa.add(val[i]!);
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => CGPAop(gpa),
                              ),
                            );
                          }
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 85, 0, 86),
                      padding: const EdgeInsets.all(10),
                    ),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    label: Text(
                      "Calculate",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
