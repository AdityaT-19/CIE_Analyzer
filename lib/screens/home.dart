import 'package:cie_final/screens/cgpa_semip.dart';
import 'package:cie_final/screens/cie_sub_select.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home"),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                "Home",
                style: Theme.of(context).textTheme.displayLarge,
                colors: const [
                  Colors.white,
                  Color.fromARGB(255, 86, 0, 84),
                ],
              ),
              GradientText(
                "Select an Option",
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
                colors: const [
                  Colors.white,
                  Color.fromARGB(255, 86, 0, 84),
                ],
              ),
              const SizedBox(
                height: 85,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => CIESubScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 85, 0, 86),
                            padding: EdgeInsets.all(15),
                          ),
                          icon: Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          label: Text("CIE Calculator",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => CGPASemIpScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 85, 0, 86),
                            padding: EdgeInsets.all(13),
                          ),
                          icon: Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          label: Text(
                            "CGPA Calculator",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 29,
                                ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
