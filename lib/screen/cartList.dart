import 'dart:convert';

import 'package:basic_cart_provider_navigator_flutter/screen/itemList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/cartList.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Replant Bangladesh',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: baseColor,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15),
            child: Text(
              'Cart List',
              style: TextStyle(fontSize: 35),
            ),
          ),
          Expanded(
            child: Consumer<Operations>(
              builder: ((context, value, child) => ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(cartListImage[index]),
                        title: Text(
                          cartList[index],
                          style: GoogleFonts.cabin(
                            textStyle: TextStyle(fontSize: 15),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "\$ ${cartListPrice[index] * cartListQuantity[index]}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: baseColor,
                                size: 22,
                              ),
                              onPressed: () {
                                var operations = context.read<Operations>();
                                operations.addItemQuantityOne(cartList[index]);
                              },
                            ),
                            Text(
                              '${cartListQuantity[index]}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: baseColor,
                                size: 22,
                              ),
                              onPressed: () {
                                final message = SnackBar(
                                  content: Text(
                                    "'${cartList[index]}' removed from Cart",
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

                                var operations = context.read<Operations>();
                                operations
                                    .removeItemQuantityOne(cartList[index]);
                                if (cartListQuantity[index] == 0) {
                                  operations.removeItem(cartList[index]);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(message);
                                }
                              },
                            ),
                          ],
                        ),
                        isThreeLine: true,
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ItemList()));
        },
        backgroundColor: baseColor,
        child: Icon(Icons.home_filled),
      ),
    );
  }
}
