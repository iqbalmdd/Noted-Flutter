import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromARGB(255, 58, 70, 139),
        foregroundColor: const Color.fromARGB(255, 89, 103, 176)
      )),
    );
  }
  
}
