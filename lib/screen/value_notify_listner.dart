import 'dart:developer';
import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("Use STLW Like STFW")),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) => TextFormField(
              obscureText: toggle.value,
              decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: InkWell(
                      onTap: () {
                        toggle.value = !toggle.value;
                      },
                      child: Icon(toggle.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility))),
            ),
          ),
          Center(
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
        ],
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
