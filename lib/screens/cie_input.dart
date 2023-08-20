import 'package:cie_final/models/details.dart';
import 'package:cie_final/screens/cie_output.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CIEInputScreen extends StatefulWidget {
  CIEInputScreen(this.sub, {super.key});

  final Subject sub;

  @override
  State<CIEInputScreen> createState() {
    return _CIEInputScreenBu();
  }
}

class _CIEInputScreenBu extends State<CIEInputScreen> {
  Map<Event, TextEditingController> txtContL = {
    for (var event in Event.values) event: TextEditingController(),
  };

  Map<Event, bool?> validate = {
    for (var event in Event.values) event: null,
  };
  Map<Event, double?> val = {
    for (var event in Event.values) event: null,
  };
  String? errMes(Event e, double? val) {
    validate[e] = val == null || val.isNegative || val > 20;
    if (validate[e]!) {
      if (val == null) {
        return "Can't be EMPTY!!!";
      } else {
        return "INVALID Value!!!";
      }
    } else {
      return null;
    }
  }

  Map<Event, String?> eMes = {
    for (var event in Event.values) event: null,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("CIE Input"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Expanded(
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              GradientText(
                "Enter your Event Marks for subject ${widget.sub.subTitle}",
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
              Column(
                children: [
                  for (var event in Event.values)
                    TextField(
                      controller: txtContL[event],
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        label: Text(
                          "Enter the Marks for Event - ${event.name}",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        errorText: eMes[event],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onChanged: (value) {
                        val[event] = double.tryParse(value);
                        setState(
                          () {
                            eMes[event] = errMes(event, val[event]);
                          },
                        );
                      },
                    ),
                ],
              ),
              const SizedBox(
                height: 40,
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
                            for (var event in Event.values) {
                              eMes[event] = errMes(event, val[event]);
                              if (eMes[event] != null) {
                                check = false;
                              }
                            }
                            if (check) {
                              for (var event in Event.values) {
                                widget.sub.marks[event] = val[event]!.toInt();
                                print(widget.sub.marks[event]);
                              }
                              widget.sub.cie = 0;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => CIEOutputScreen(
                                      widget.sub, widget.sub.cieMess),
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
              )
            ],
          ),
        )),
      ),
    );
  }
}
