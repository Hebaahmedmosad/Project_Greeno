import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greeno/constants.dart';
//import 'package:greeno/screens/details/components/card.dart';
//import 'icon_card.dart';
import 'image_and_icons.dart';
import 'title_and_price.dart'; 
import 'package:greeno/screens/details/components/credit_card.dart';

class Body extends StatelessWidget {
 final String title , familyName,image;
  final int price;
   const Body({
    Key key,
    this.title,
    this.image,
    this.familyName,
    this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size,image:image),
          TitleAndPrice(title: title, familyName: familyName, price:price),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              Spacer(),
              SizedBox(
                width: size.width *(2/4),
                height: 64,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  color: kPrimaryColor,
                  
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageTwo(
                              
                            )),
                  );
                },
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
             
              
            ],
          ),
        ],
      ),
    );
  }
}
