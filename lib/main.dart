import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter full course')),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Placeholder(),
        ),
      ),
    );
  }
}
