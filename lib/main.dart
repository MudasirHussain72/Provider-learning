import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/providers/count_provider.dart';
import 'package:mvvm_with_provider/providers/example_one_provider.dart';
import 'package:mvvm_with_provider/providers/favourite_provider.dart';
import 'package:mvvm_with_provider/providers/theme_changer_provider.dart';
import 'package:mvvm_with_provider/screen/count_example.dart';
import 'package:mvvm_with_provider/screen/example_one.dart';
import 'package:mvvm_with_provider/screen/favourite/favourite_screen.dart';
import 'package:mvvm_with_provider/screen/theme.dart';
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
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider())
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger =
              Provider.of<ThemeChangerProvider>(context, listen: false);
          print("build");
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.amber,
            ),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: AppBarTheme(color: Colors.green.shade200),
                iconTheme: IconThemeData(color: Colors.green)),
            home: const ThemeScreen(),
          );
        },
      ),
    );
  }
}
