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
          RadioButtonTest(),
          RadioButtonTest(),
        ],
      ),
    );
  }
}

enum TestValues {R1, R2, R3}

class RadioButtonTest extends StatefulWidget {
  const RadioButtonTest({super.key});

  @override
  State<RadioButtonTest> createState() => _RadioButtonTestState();
}

class _RadioButtonTestState extends State<RadioButtonTest> {
  TestValues? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<TestValues>(value: TestValues.R1,groupValue: selectedValue, onChanged: (value) => setState(() {
          selectedValue = value;
        })),
        Radio<TestValues>(value: TestValues.R2,groupValue: selectedValue, onChanged: (value) => setState(() {
          selectedValue = value;
        })),
        Radio<TestValues>(value: TestValues.R3,groupValue: selectedValue, onChanged: (value) => setState(() {
          selectedValue = value;
        })),
      ],
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
