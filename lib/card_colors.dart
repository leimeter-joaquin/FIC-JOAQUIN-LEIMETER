import 'dart:ui';

class CardColors {
  static final CardColors _instance = CardColors._internal();

  // Primary
  final softBlue = const Color(0xff8BACDA);
  final cyan = const Color(0xff00FFF7);

  // Neutral
  final background = const Color(0xff14253D);
  final cardBackground = const Color(0xff1B335A);
  final line = const Color(0xff2F415B);
  final white = const Color(0xffffffff);

  factory CardColors() {
    return _instance;
  }

  CardColors._internal();
}
