import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greeno/screens/details/details_screen.dart';

import '../../../constants.dart';

class FeaturedPlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Row(
         children: <Widget>[
           StreamBuilder<QuerySnapshot>(
         stream: FirebaseFirestore.instance.collection('plant').snapshots(),
        builder: (context, AsyncSnapshot <QuerySnapshot>snapshot) {
          if (!snapshot.hasData) 
          {return Text('data is loading');}
            return  FeaturePlantCard(image:snapshot.data.docs[0]['image'].toString(),
                 title:snapshot.data.docs[0]['name'].toString() ,
                 familyName:snapshot.data.docs[0]['familyname'].toString(),price: snapshot.data.docs[0]['price'],
                 press: (){ Navigator.push( context, MaterialPageRoute( builder: (context) => DetailsScreen(
                    title:snapshot.data.docs[0]['name'].toString() ,
                 familyName:snapshot.data.docs[0]['familyname'].toString(),price: snapshot.data.docs[0]['price'],
                 image:snapshot.data.docs[0]['image'].toString(),
                 
                 ),
                    ), 
                   ); });
        }),
        StreamBuilder<QuerySnapshot>(
         stream: FirebaseFirestore.instance.collection('plant').snapshots(),
        builder: (context, AsyncSnapshot <QuerySnapshot>snapshot) {
          if (!snapshot.hasData) 
          {return Text('data is loading');}
            return  FeaturePlantCard(image:snapshot.data.docs[1]['image'].toString(),
                 title:snapshot.data.docs[1]['name'].toString() ,
                 familyName:snapshot.data.docs[1]['familyname'].toString(),price: snapshot.data.docs[1]['price'],
                 press: (){ Navigator.push( context, MaterialPageRoute( builder: (context) => DetailsScreen(
                   title:snapshot.data.docs[1]['name'].toString() ,
                 familyName:snapshot.data.docs[1]['familyname'].toString(),price: snapshot.data.docs[1]['price'],
                  image: snapshot.data.docs[1]['image'],
                 ),
                    ), 
                   ); });
        }),
        StreamBuilder<QuerySnapshot>(
         stream: FirebaseFirestore.instance.collection('plant').snapshots(),
        builder: (context, AsyncSnapshot <QuerySnapshot>snapshot) {
          if (!snapshot.hasData) 
          {return Text('data is loading');}
            return  FeaturePlantCard(image:snapshot.data.docs[2]['image'].toString(),
                 title:snapshot.data.docs[2]['name'].toString() ,
                 familyName:snapshot.data.docs[2]['familyname'].toString(),price: snapshot.data.docs[2]['price'],
                 press: (){ Navigator.push( context, MaterialPageRoute( builder: (context) => DetailsScreen(
                    title:snapshot.data.docs[2]['name'].toString() ,
                 familyName:snapshot.data.docs[2]['familyname'].toString(),price: snapshot.data.docs[2]['price'],
                 image: snapshot.data.docs[2]['image'],
                 ),
                    ), 
                   ); });
        }),
        //    StreamBuilder<QuerySnapshot>(
        //  stream: FirebaseFirestore.instance.collection('plant').snapshots(),
        // builder: (context, AsyncSnapshot <QuerySnapshot>snapshot) {
        //   if (moreBtnStatus) 
        //     return  FeaturePlantCard(image:snapshot.data.docs[2]['image'].toString(),
        //          title:snapshot.data.docs[7]['name'].toString() ,
        //          familyName:snapshot.data.docs[7]['familyname'].toString(),price: snapshot.data.docs[7]['price'],
        //          press: (){ Navigator.push( context, MaterialPageRoute( builder: (context) => DetailsScreen(
        //             title:snapshot.data.docs[7]['name'].toString() ,
        //          familyName:snapshot.data.docs[7]['familyname'].toString(),price: snapshot.data.docs[7]['price'],
        //          image: snapshot.data.docs[7]['image'],
        //          ),
        //             ), 
        //            ); });
        // }),
       ],
      ),
     );            
  }
   
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key key,
    this.image,
    this.title,
    this.familyName,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, familyName;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return Container(
     padding: const EdgeInsets.all(5.0),
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.54,
      child: Column(
        children: <Widget>[
          Image.network(image,width: size.width*0.54, height: 230,
                        fit:BoxFit.fill),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$familyName".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '$price EGP',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
