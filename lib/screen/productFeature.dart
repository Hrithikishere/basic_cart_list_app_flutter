import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/cartList.dart';
import '../main.dart';

class ProductFeature extends StatelessWidget {
  //const ProductFeature({super.key});

  String? plantName;
  double plantPrice = 0.0;
  String? plantImg;
  var index;

  ProductFeature(
      String plantName, double plantPrice, String plantImg, var index) {
    this.plantName = plantName;
    this.plantPrice = plantPrice;
    this.plantImg = plantImg;
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Replant Bangladesh',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: baseColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartList()));
            },
            icon: Icon(Icons.shopping_cart_checkout_rounded),
          )
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(13),
                child: Image.network(
                  "$plantImg",
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),

              Center(
                child: Text(
                  "$plantName",
                  style: GoogleFonts.cabin(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "\$ $plantPrice",
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: baseColor),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  "Product Details:",
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: Text(
                    '${specs[index]}',
                    style: GoogleFonts.cabin(textStyle: TextStyle()),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: Text(
                    '${desc[index]}',
                    style: GoogleFonts.cabin(textStyle: TextStyle()),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),

              //Spacer(),)
            ],
          ),
        )
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10, top: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  final message = SnackBar(
                    content: Text(
                      "'${plantNames[index]}' added in Cart",
                      style: TextStyle(color: fontColor),
                    ),
                    padding: const EdgeInsets.all(18.0),
                    duration: const Duration(seconds: 1),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    behavior: SnackBarBehavior.floating,
                    elevation: 6.0,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(message);

                  var operations = context.read<Operations>();
                  if (cartList.contains(plantNames[index])) {
                    operations.addItemQuantityOne(plantNames[index]);
                  } else {
                    operations.addItem(plantNames[index]);
                    operations.addItemPrice(plantPrices[index]);
                    operations.addItemImage(linkList[index]);
                    operations.addItemQuantity(1);
                  }
                },
                label: const Text('Add to cart'),
                icon: const Icon(
                  Icons.add_shopping_cart_rounded,
                  size: 17,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: baseColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 18),
                  textStyle: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
