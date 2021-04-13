import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({@required this.colour, this.cardChild});

  final Color colour;
  final cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}
