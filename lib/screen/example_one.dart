import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/providers/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<ExampleOneProvider>(
          builder: (context, value, child) => Slider(
            value: value.value,
            min: 0,
            max: 1,
            onChanged: (val) {
              value.setValue(val);
              print("only this widget build");
            },
          ),
        ),
        Consumer<ExampleOneProvider>(
          builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.yellow.withOpacity(value.value)),
                  child: Center(child: Text("Container 1")),
                )),
                Expanded(
                    child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(value.value)),
                  child: Center(child: Text("Container 2")),
                ))
              ],
            );
          },
        ),
      ]),
    );
  }
}
