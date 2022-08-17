import 'package:behance/data/image_assets.dart';

class Token {
  String imagePath;
  String name;
  double value;
  bool isMine;
  bool isFavorite;
  bool showCheck;

  Token({
    required this.imagePath,
    required this.name,
    required this.value,
    this.isFavorite = false,
    this.isMine = false,
    this.showCheck = true,
  });

  static List<Token> dummyData = [
    Token(
      imagePath: ImageAssets.waves,
      name: "Waves",
      value: 5.0054,
      isFavorite: true,
    ),
    Token(
      imagePath: ImageAssets.pigeon,
      name: "Pigeon",
      value: 1444.605,
      isMine: true,
      showCheck: false,
    ),
    Token(
      imagePath: ImageAssets.dollar,
      name: "US Dollar",
      value: 10.05,
    ),
  ];
}
