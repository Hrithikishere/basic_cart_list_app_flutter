import 'package:basic_cart_provider_navigator_flutter/screen/cartList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/productFeature.dart';
import '../main.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fontColor,
      appBar: AppBar(
        title: Text(
          'Replant Bangladesh',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: baseColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
            child: Text(
              'All Products',
              style: TextStyle(fontSize: 32),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 10, left: 10, right: 10),
            child: Text(
              'All of our premium cactus and succulents plants for sale.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),

          //------------------------------------------

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              padding: EdgeInsets.all(5.0),
              itemCount: plantNames.length,
              itemBuilder: (BuildContext context, int index) {
                String plantName;
                double plantPrice;
                String plantImg;
                plantName = plantNames[index];
                plantPrice = plantPrices[index];
                plantImg = linkList[index];

                return Products(plantName, plantPrice, plantImg, index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartList()));
        },
        backgroundColor: baseColor,
        child: Icon(Icons.shopping_cart_checkout_outlined),
      ),
    );
  }
}

//-------------------

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        padding: EdgeInsets.all(5.0),
        itemCount: plantNames.length,
        itemBuilder: (BuildContext context, int index) {
          String plantName;
          double plantPrice;
          String plantImg;
          plantName = plantNames[index];
          plantPrice = plantPrices[index];
          plantImg = linkList[index];

          return Products(plantName, plantPrice, plantImg, index);
        },
      ),
    );
  }
}

class Products extends StatelessWidget {
  //const Products({Key? key}) : super(key: key);

  String? plantName;
  double plantPrice = 0.0;
  String? plantImg;
  var index;

  Products(String plantName, double plantPrice, String plantImg, var index) {
    this.plantName = plantName;
    this.plantPrice = plantPrice;
    this.plantImg = plantImg;
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductFeature(
                      plantName!, plantPrice, plantImg!, index)));
        },
        child: Container(
          height: 800,
          width: 100,
          color: fontColor,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.network(
                plantImg!,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 30,
                child: Container(
                  color: Colors.white70,
                  height: 42,
                  width: 170,
                ),
              ),
              Positioned(
                bottom: 53,
                child: Text(
                  plantName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ), //Plant Name

              Positioned(
                bottom: 32,
                child: Text(
                  '\$ $plantPrice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: baseColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ), //Plant Price

              Positioned(
                bottom: 0,
                child: CartButton(index),
                height: 30,
                width: 200,
              ),
            ],
          ),
        ));
  }
}

class CartButton extends StatelessWidget {
  //const CartButton({super.key});

  var index;

  CartButton(var index) {
    this.index = index;
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final message = SnackBar(
          content: Text(
            "'${plantNames[index]}' added in Cart",
            style: TextStyle(color: fontColor),
          ),
          padding: const EdgeInsets.all(18.0),
          duration: const Duration(seconds: 1),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
      child: Text('Add to Cart'),
      style: ElevatedButton.styleFrom(
          backgroundColor: baseColor, // background (button) color
          foregroundColor: Colors.white // foreground (text) color
          ),
//      icon: Icon(Icons.shopping_cart_checkout),
    );
  }
}

class ListPrint extends StatelessWidget {
  const ListPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              itemList[index],
              style: GoogleFonts.cabin(
                textStyle: TextStyle(fontSize: 15),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () {
                var operations = context.read<Operations>();
                operations.addItem(itemList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
