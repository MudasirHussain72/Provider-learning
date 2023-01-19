import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/providers/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    // final themeChanger =
    // Provider.of<ThemeChangerProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer"),
      ),
      body: Column(children: [
        Consumer<ThemeChangerProvider>(
          builder: (context, value, child) {
            print("only this widget build");
            return RadioListTile<ThemeMode>(
                title: Text("Light Mode"),
                value: ThemeMode.light,
                groupValue: value.themeMode,
                onChanged: value.setTheme);
          },
        ),
        Consumer<ThemeChangerProvider>(
          builder: (context, value, child) {
            print("only this widget build");
            return RadioListTile<ThemeMode>(
                title: Text("Dark Mode"),
                value: ThemeMode.dark,
                groupValue: value.themeMode,
                onChanged: value.setTheme);
          },
        ),
        Consumer<ThemeChangerProvider>(
          builder: (context, value, child) {
            print("only this widget build");
            return RadioListTile<ThemeMode>(
                title: Text("System Mode"),
                value: ThemeMode.system,
                groupValue: value.themeMode,
                onChanged: value.setTheme);
          },
        ),
        Icon(Icons.thunderstorm_rounded)
      ]),
    );
  }
}
