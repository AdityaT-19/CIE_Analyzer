import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText(this.label, {super.key});
  final String label;
  @override
  State<StatefulWidget> createState() {
    return _InputTextState();
  }
}

class _InputTextState extends State<InputText> {
  final TextEditingController txtCont = TextEditingController();
  bool validate = false;
  String? errMes;
  void onSubmit(double? val) {
    setState(() {
      validate = val == null || val.isNegative || val > 20;
      if (validate) {
        if (val == null) {
          errMes = "Can't be EMPTY!!!";
        } else {
          errMes = "INVALID Value!!!";
        }
      } else {
        errMes = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: TextField(
        controller: txtCont,
        keyboardType: TextInputType.number,
        maxLength: 2,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
        decoration: InputDecoration(
          label: Text(
            widget.label,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          errorText: errMes,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onSubmitted: (value) {
          double? val = double.tryParse(value);
          onSubmit(val);
          if (!validate) {
            print(val);
          }
        },
      ),
    );
  }
}
