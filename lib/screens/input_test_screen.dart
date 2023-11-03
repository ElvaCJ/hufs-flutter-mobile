import 'package:flutter/material.dart';

class InputTestScreen extends StatefulWidget {
  const InputTestScreen({super.key});

  @override
  State<InputTestScreen> createState() => _InputTestScreenState();
}

class _InputTestScreenState extends State<InputTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Input Widget'),
      ),
      body: const Column(
        children: [
          CheckBoxTest(),
          CheckBoxTest(),
          CheckBoxTest(),
        ],
      ),
    );
  }
}

class CheckBoxTest extends StatefulWidget {
  const CheckBoxTest({super.key});

  @override
  State<CheckBoxTest> createState() => _CheckBoxTestState();
}

class _CheckBoxTestState extends State<CheckBoxTest> {
  late List<bool> values;

  @override
  void initState() {
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: values[0], onChanged: (value) => onChanged(0, value: value)),
        Checkbox(
            value: values[1], onChanged: (value) => onChanged(1, value: value)),
        Checkbox(
            value: values[2], onChanged: (value) => onChanged(2, value: value)),
      ],
    );
  }

  void onChanged(int index, {bool? value = false}) {
    setState(() {
      values[index] = value!;
    });
  }
}
