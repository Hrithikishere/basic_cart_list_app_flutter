import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/cartList.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/itemList.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/splashScreen.dart';

List<String> itemList = [
  "Ball Cactus",
  "Aloe Vera",
  "Panda Plant",
  "Money Plant",
  "Dolphin Succulent",
  "Bunny Ears Cactus",
  "Pothos",
  "Monstera",
  "Lucky Bamboo",
  "Spider Plant",
  "Snake Plant",
  "Olivia",
  "Christmas Cactus",
  "Panda Plant",
  "Easter Cactus",
  "Old Lady Cactus",
  "Star Cactus"
];

var baseColor = const Color(0xFF1C6758);
var primaryColor = const Color(0xFF3D8361);
var buttonColor = const Color(0xFFD6CDA4);
var fontColor = Color.fromARGB(255, 249, 255, 248);

List<String> plantNames = [
  'Haworthia Cooperi',
  'Echeveria Salsa Verde',
  'Echeveria Early Sunrise',
  'Jade Succulent',
  'Echeveria Spark',
  'Echeveria Lola',
  'Aloe Aristata',
  'Echeveria Purple Pearl',
  'Echeveria Purporeum',
];

List<String> plantPrices = [
  '\$8.99',
  '\$6.99',
  '\$6.99',
  '\$6.99',
  '\$6.99',
  '\$7.99',
  '\$6.99',
  '\$6.99',
  '\$5.99',
];

List<String> linkList = [
  "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/haworthiacooperi_1000x.png?v=1638997982",
  "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/EcheveriaSalsaVerde_1000x.png?v=1634060356",
  "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/EcheveriaEarlySunrise_1000x.png?v=1637796197",
  "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/Jade_1_1000x.png?v=1634061443",
  "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/EcheveriaSpark_1000x.png?v=1637796697",
  "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/EcheveriaLola_1000x.png?v=1639000510",
  "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/AloeAristata_1000x.png?v=1639000515",
  "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/EcheveriaPurplePearl_1000x.png?v=1638999308",
  "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/EcheveriaPurporeum_1000x.png?v=1639000635",
];

List<String> cartList = [];
List<String> cartListPrice = [];
List<int> cartListQuantity = [];

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Operations(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
      home: SplashScreen(),
    );
  }
}

class Operations with ChangeNotifier {
  String item = '';

  void addItem(String item) {
    cartList.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    cartList.remove(item);
    notifyListeners();
  }
}
