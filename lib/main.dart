import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/providers/count_provider.dart';
import 'package:mvvm_with_provider/providers/example_one_provider.dart';
import 'package:mvvm_with_provider/screen/count_example.dart';
import 'package:mvvm_with_provider/screen/example_one.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        home: const ExampleOne(),
      ),
    );
  }
}
