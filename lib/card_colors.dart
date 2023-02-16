import 'dart:ui';

class CardColors {
  static final CardColors _instance = CardColors._internal();

  // Primary
  final softBlue = const Color(0xff0000ff);
  final cyan = const Color(0xff0000aa);

  // Neutral
  final background = const Color(0xff22ff22);
  final cardBackground = const Color(0xff2bbfff);
  final line = const Color(0xff2bb5ff);
  final white = const Color(0xffffffff);

  factory CardColors() {
    return _instance;
  }

  CardColors._internal();
}
