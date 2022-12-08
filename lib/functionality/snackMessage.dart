import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:basic_cart_provider_navigator_flutter/main.dart';

class SnackMessage extends StatelessWidget {
  //const SnackMessage({super.key});

  String itemName = '';
  SnackMessage(String itemName) {
    this.itemName = itemName;
  }

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        "${itemName} removed from Cart",
        style: TextStyle(color: fontColor),
      ),
      padding: const EdgeInsets.all(20.0),
      duration: const Duration(seconds: 1),
      backgroundColor: primaryColor,
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      elevation: 6.0,
    );
  }
}

//final message = ScaffoldMessenger.of(context).showSnackBar(message);
