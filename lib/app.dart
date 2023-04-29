import 'package:flutter/material.dart';
import 'package:number_generator/screen/number_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const NumberChecker(),
      },
    );
  }
}
