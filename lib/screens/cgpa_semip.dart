import 'package:cie_final/screens/cgpa_gpaip.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CGPASemIpScreen extends StatefulWidget {
  CGPASemIpScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CGPASemIpScreenBu();
  }
}

class _CGPASemIpScreenBu extends State<CGPASemIpScreen> {
  late int semno;
  TextEditingController txtcont = TextEditingController();
  String? eMes;
  bool validate = true;
  String? errMes(double? val) {
    validate = val == null || val.isNegative || val > 8 || val < 1;
    if (validate) {
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
        title: Text("Semsters"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientText(
              "Enter the number of semesters : ",
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: txtcont,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
                decoration: InputDecoration(
                  label: Text(
                    "Enter the number of semesters : ",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  errorText: eMes,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  double? val = double.tryParse(value);
                  setState(
                    () {
                      eMes = errMes(val);
                      if (!validate) {
                        semno = val!.toInt();
                      }
                    },
                  );
                },
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (!validate) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => CGPAipScreen(semno),
                      ),
                    );
                  }
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
                  "Next",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
