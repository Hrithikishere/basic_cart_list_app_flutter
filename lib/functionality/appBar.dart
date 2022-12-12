import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Replant Bangladesh',
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: baseColor),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
