import 'package:google_fonts/google_fonts.dart';
import 'package:fic_joaquin_leimeter/card_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  CardColors();
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
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: CardColors().background,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
            child: MyCard(),
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.amber),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'AAA',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const Text('asd'),
          const Text('asd'),
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/icon-ethereum.svg',
              semanticsLabel: 'Acme Logo',
            ),
          )
        ],
      ),
    );
  }
}
