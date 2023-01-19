import 'dart:developer';

import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("Use STLW Like STFW")),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (context, value, child) {
            return Text(
              value.toString(),
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter.value++;
            log(_counter.value.toString());
          },
          child: Icon(Icons.add)),
    );
  }
}
