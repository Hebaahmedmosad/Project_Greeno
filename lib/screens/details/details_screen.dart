import 'package:flutter/material.dart';
import 'package:greeno/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
   final String title , familyName,image;
  final int price;
   const DetailsScreen({
    Key key,
    this.title,
    this.image,
    this.familyName,
    this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(title: title,familyName: familyName,price: price,image:image),
    );
  }
}
