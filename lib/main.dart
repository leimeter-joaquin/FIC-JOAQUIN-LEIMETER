import 'package:google_fonts/google_fonts.dart';
import 'package:fic_joaquin_leimeter/card_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

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
            padding: EdgeInsets.fromLTRB(40, 80, 40, 0),
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
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: CardColors().cardBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: const Image(
              image: AssetImage('assets/card/images/image-equilibrium.jpg'),
            ),
          ),

          const Gap(20),

          // Title
          Text(
            'Title',
            style: TextStyle(color: CardColors().white),
          ),

          const Gap(20),

          // description
          const Text('Description'),

          const Gap(20),

          // price & expiration
          Row(
            children: [
              Row(
                children: [
                  // Etherium Icon
                  SvgPicture.asset(
                    'assets/card/icons/icon-ethereum.svg',
                    semanticsLabel: 'Acme Logo',
                  ),

                  // price with ETH, maybe wrap in Row
                  const Text('0.041'),
                  const Text('ETH'),
                ],
              ),
              Row(
                children: [
                  // Clok icon
                  SvgPicture.asset(
                    'assets/card/icons/icon-ethereum.svg',
                    semanticsLabel: 'Acme Logo',
                  ),

                  // days left
                  const Text('3 days left')
                ],
              )
            ],
          ),

          const Gap(20),

          // Divider
          Divider(color: CardColors().white),

          const Gap(20),

          // user
          Row(
            children: const [
              // User Icon
              Image(
                image: AssetImage('assets/card/images/image-avatar.png'),
              ),

              // Creation of Jules Wyvern
              Text('creation of this dude')
            ],
          ),
        ],
      ),
    );
  }
}


          //   'AAA',
          //   style: TextStyle(fontWeight: FontWeight.w600),
          // ),
          // const Text('asd'),
          // const Text('asd'),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: SvgPicture.asset(
          //     'assets/icon-ethereum.svg',
          //     semanticsLabel: 'Acme Logo',
          //   ),
          // )

          // Align(
          //   alignment: Alignment.topLeft,
          //   child: SvgPicture.asset(
          //     'assets/card/icons/icon-ethereum.svg',
          //     semanticsLabel: 'Acme Logo',
          //   ),
          // ),

