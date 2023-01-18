import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/providers/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    log("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Example with provider"),
        centerTitle: true,
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          log("only this counter builds");
          return Text(
            value.count.toString(),
            style: TextStyle(fontSize: 24),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.setCount();
          },
          child: Icon(Icons.add)),
    );
  }
}
