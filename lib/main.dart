import 'package:basic_cart_provider_navigator_flutter/screen/productFeature.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/cartList.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/itemList.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/splashScreen.dart';
import 'dart:math';

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

List<double> plantPrices = [
  8.99,
  6.99,
  6.99,
  6.99,
  6.99,
  7.99,
  6.99,
  6.99,
  5.99,
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

List<String> desc = [
  "Haworthia succulents are a genus of succulents in the Asphodelaceae family. Haworthia succulents are native to many parts of Southern Africa, specifically Namibia, Mozambique, and South Africa. Haworthia succulents are incredibly resilient and hardy succulent plants. Haworthia succulents are treasured amongst many succulent enthusiasts and beginners for their easy to care for nature and ability to survive indoors with very little light or water.",
  "Echeveria succulents are a genus of succulents in the Crassulaceae family. Echeveria succulents are native to many parts of Central America, specifically Mexico. Echeveria succulents are incredibly vibrant and colorful succulent plants. Echeveria succulents are treasured amongst all succulent enthusiasts for their beautiful rosette shapes.",
  "Echeveria succulents are a genus of succulents in the Crassulaceae family. Echeveria succulents are native to many parts of Central America, specifically Mexico. Echeveria succulents are incredibly vibrant and colorful succulent plants. Echeveria succulents are treasured amongst all succulent enthusiasts for their beautiful rosette shapes.",
  "Jade plants are succulent houseplants, which makes them fairly resilient and easy to grow indoors—plus, they’re capable of living a long, long time with proper care! See how to care for your jade plant.",
  "Echeveria succulents are a genus of succulents in the Crassulaceae family. Echeveria succulents are native to many parts of Central America, specifically Mexico. Echeveria succulents are incredibly vibrant and colorful succulent plants. Echeveria succulents are treasured amongst all succulent enthusiasts for their beautiful rosette shapes.",
  "Echeveria succulents are a genus of succulents in the Crassulaceae family. Echeveria succulents are native to many parts of Central America, specifically Mexico. Echeveria succulents are incredibly vibrant and colorful succulent plants. Echeveria succulents are treasured amongst all succulent enthusiasts for their beautiful rosette shapes.",
  "Aloe succulents are a genus of succulents in the Asphodelaceae family. Aloe succulents are native to Madagascar, Jordan, Southern Africa, and the Arabian Peninsula. Aloe succulents are incredibly versatile succulent plants. Aloe succulents are treasured amongst all succulent enthusiasts for their long leaves, and their ability to thrive in both outdoor and indoor spaces.",
  "Echeveria succulents are a genus of succulents in the Crassulaceae family. Echeveria succulents are native to many parts of Central America, specifically Mexico. Echeveria succulents are incredibly vibrant and colorful succulent plants. Echeveria succulents are treasured amongst all succulent enthusiasts for their beautiful rosette shapes.",
  "Echeveria succulents are a genus of succulents in the Crassulaceae family. Echeveria succulents are native to many parts of Central America, specifically Mexico. Echeveria succulents are incredibly vibrant and colorful succulent plants. Echeveria succulents are treasured amongst all succulent enthusiasts for their beautiful rosette shapes.",
];

List<String> specs = [
  "- Large 4-Inch Size: One Haworthia Cooperi Planted in a 4-Inch Grower Pot. \n- Hand-Picked:  Selected from our greenhouses 24 hours before fulfillment. \n- Water Wise: Only water once every 2-3 weeks. \n- High Quality: Family Farm with 55+ years of experience growing succulents. \n- Secure Delivery: Secure packaging & shipping. Customer satisfaction guaranteed. ",
  "- Large 4-Inch Size: One Echeveria Salsa Verde Planted in a 4-Inch Grower Pot.  \n- Hand-Picked:  Selected from our greenhouses 24 hours before fulfillment. \n- Water Wise: Only water once every 2-3 weeks. \n- High Quality: Family Farm with 55+ years of experience growing succulents. \n- Secure Delivery: Secure packaging & shipping. Customer satisfaction guaranteed. ",
  "- Large 4-Inch Size: One Echeveria Salsa Verde Planted in a 4-Inch Grower Pot.  \n- Hand-Picked:  Selected from our greenhouses 24 hours before fulfillment. \n- Water Wise: Only water once every 2-3 weeks. \n- High Quality: Family Farm with 55+ years of experience growing succulents. \n- Secure Delivery: Secure packaging & shipping. Customer satisfaction guaranteed. ",
  "- Large 4-Inch Size: One Haworthia Cooperi Planted in a 4-Inch Grower Pot. \n- Hand-Picked:  Selected from our greenhouses 24 hours before fulfillment. \n- Water Wise: Only water once every 2-3 weeks. \n- High Quality: Family Farm with 55+ years of experience growing succulents. \n- Secure Delivery: Secure packaging & shipping. Customer satisfaction guaranteed. ",
  "- Large 4-Inch Size: One Echeveria Salsa Verde Planted in a 4-Inch Grower Pot.  \n- Hand-Picked:  Selected from our greenhouses 24 hours before fulfillment. \n- Water Wise: Only water once every 2-3 weeks. \n- High Quality: Family Farm with 55+ years of experience growing succulents. \n- Secure Delivery: Secure packaging & shipping. Customer satisfaction guaranteed. ",
  "- Large 4-Inch Size: One Echeveria Salsa Verde Planted in a 4-Inch Grower Pot.  \n- Hand-Picked:  Selected from our greenhouses 24 hours before fulfillment. \n- Water Wise: Only water once every 2-3 weeks. \n- High Quality: Family Farm with 55+ years of experience growing succulents. \n- Secure Delivery: Secure packaging & shipping. Customer satisfaction guaranteed. ",
  "- Large 4-Inch Size: One Haworthia Cooperi Planted in a 4-Inch Grower Pot. \n- Hand-Picked:  Selected from our greenhouses 24 hours before fulfillment. \n- Water Wise: Only water once every 2-3 weeks. \n- High Quality: Family Farm with 55+ years of experience growing succulents. \n- Secure Delivery: Secure packaging & shipping. Customer satisfaction guaranteed. ",
  "- Large 4-Inch Size: One Echeveria Salsa Verde Planted in a 4-Inch Grower Pot.  \n- Hand-Picked:  Selected from our greenhouses 24 hours before fulfillment. \n- Water Wise: Only water once every 2-3 weeks. \n- High Quality: Family Farm with 55+ years of experience growing succulents. \n- Secure Delivery: Secure packaging & shipping. Customer satisfaction guaranteed. ",
  "- Large 4-Inch Size: One Echeveria Salsa Verde Planted in a 4-Inch Grower Pot.  \n- Hand-Picked:  Selected from our greenhouses 24 hours before fulfillment. \n- Water Wise: Only water once every 2-3 weeks. \n- High Quality: Family Farm with 55+ years of experience growing succulents. \n- Secure Delivery: Secure packaging & shipping. Customer satisfaction guaranteed. ",
];

List<String> cartList = [];
List<double> cartListPrice = [];
List<String> cartListImage = [];
List<int> cartListQuantity = [];
double TotalPrice = 0.0;

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

  void addItemPrice(double item) {
    cartListPrice.add(item);
    notifyListeners();
  }

  void addItemQuantity(int item) {
    cartListQuantity.add(item);
    notifyListeners();
  }

  void addItemQuantityOne(String item) {
    int index = cartList.indexOf(item);
    cartListQuantity[index] = cartListQuantity[index] + 1;
    notifyListeners();
  }

  void removeItemQuantityOne(String item) {
    int index = cartList.indexOf(item);
    cartListQuantity[index] = cartListQuantity[index] - 1;
    notifyListeners();
  }

  void addItemImage(String item) {
    cartListImage.add(item);
    notifyListeners();
  }

  void totalPrice() {
    double tP = 0.0;
    for (int i = 0; i < cartListPrice.length; i++) {
      tP = tP + (cartListPrice[i] * cartListQuantity[i]);
    }
    TotalPrice = tP;
    notifyListeners();
  }

  void removeItem(String item) {
    int index = cartList.indexOf(item);
    cartListImage.remove(cartListImage[index]);
    cartListQuantity.remove(cartListQuantity[index]);
    cartListPrice.remove(cartListPrice[index]);
    cartList.remove(item);
    notifyListeners();
  }
}


/*ProductFeature(
          'Haworthia Cooperi',
          '\$6.99',
          "https://cdn.shopify.com/s/files/1/0088/9513/5801/products/EcheveriaSalsaVerde_1000x.png?v=1634060356",
          1),
          */