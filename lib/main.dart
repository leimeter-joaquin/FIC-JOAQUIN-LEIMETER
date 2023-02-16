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
        appBar: AppBar(
          backgroundColor: CardColors().cardBackground,
          title: const Text('Week 01 - Flutter'),
        ),
        backgroundColor: CardColors().background,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
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
              image: AssetImage(
                'assets/card/images/image-equilibrium.jpg',
              ),
            ),
          ),

          const Gap(22),

          // Title
          Text(
            'Equilibrium #3429',
            style: TextStyle(
              color: CardColors().white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Gap(16),

          // description
          Padding(
            padding: const EdgeInsets.only(
              right: 4.0,
            ),
            child: Text(
              'Our Equilibrium collection promotes balance and calm',
              style: TextStyle(
                fontSize: 16,
                color: CardColors().softBlue,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          const Gap(16),

          // price & expiration
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Etherium Icon
                  SvgPicture.asset(
                    'assets/card/icons/icon-ethereum.svg',
                    semanticsLabel: 'Acme Logo',
                  ),

                  const Gap(8),
                  // price with ETH, maybe wrap in Row
                  Text(
                    '0.041 ETH',
                    style: TextStyle(
                      color: CardColors().cyan,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Clok icon
                  SvgPicture.asset(
                    'assets/card/icons/icon-clock.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                  const Gap(8),
                  // days left
                  Text(
                    '3 days left',
                    style: TextStyle(
                      color: CardColors().softBlue,
                    ),
                  ),
                ],
              )
            ],
          ),

          const Gap(8),

          // Divider
          Divider(color: CardColors().white),

          const Gap(8),

          // user
          Row(
            children: [
              // User Icon
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                height: 40,
                child: const Image(
                  image: AssetImage('assets/card/images/image-avatar.png'),
                ),
              ),

              const Gap(18),
              // Creation of Jules Wyvern
              Text(
                'Creation of ',
                style: TextStyle(color: CardColors().softBlue),
              ),
              Text(
                'Jules Wyvern',
                style: TextStyle(color: CardColors().white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
