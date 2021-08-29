import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greeno/screens/details/details_screen.dart';
import '../../../constants.dart';

class RecomendsPlants extends StatelessWidget {
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
            return  RecomendPlantCard(image:snapshot.data.docs[5]['image'].toString(),
                 title:snapshot.data.docs[5]['name'].toString() ,
                 familyName:snapshot.data.docs[5]['familyname'].toString(),price: snapshot.data.docs[5]['price'],
                 press: (){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                     title:snapshot.data.docs[5]['name'].toString() ,
                 familyName:snapshot.data.docs[5]['familyname'].toString(),price: snapshot.data.docs[5]['price'],
                 image:snapshot.data.docs[5]['image'].toString(),
                  ),
                ),
              );
            },);
        }),
        StreamBuilder<QuerySnapshot>(
         stream: FirebaseFirestore.instance.collection('plant').snapshots(),
        builder: (context, AsyncSnapshot <QuerySnapshot>snapshot) {
          if (!snapshot.hasData) 
          {return Text('data is loading');}
            return  RecomendPlantCard(image:snapshot.data.docs[4]['image'].toString(),
                 title:snapshot.data.docs[4]['name'].toString() ,
                 familyName:snapshot.data.docs[4]['familyname'].toString(),price: snapshot.data.docs[4]['price'],
                 press: (){
                    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen( title:snapshot.data.docs[4]['name'].toString() ,
                 familyName:snapshot.data.docs[4]['familyname'].toString(),price: snapshot.data.docs[4]['price'],
                 image:snapshot.data.docs[4]['image'].toString(),),
                ),
              );
            }, 
                 );
        }),
        StreamBuilder<QuerySnapshot>(
         stream: FirebaseFirestore.instance.collection('plant').snapshots(),
        builder: (context, AsyncSnapshot <QuerySnapshot>snapshot) {
          if (!snapshot.hasData) 
          {return Text('data is loading');}
            return  RecomendPlantCard(image:snapshot.data.docs[3]['image'].toString(),
                 title:snapshot.data.docs[3]['name'].toString() ,
                 familyName:snapshot.data.docs[3]['familyname'].toString(),price: snapshot.data.docs[3]['price'],
                 press: (){
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                     title:snapshot.data.docs[3]['name'].toString() ,
                 familyName:snapshot.data.docs[3]['familyname'].toString(),price: snapshot.data.docs[3]['price'],
                 image:snapshot.data.docs[3]['image'].toString(), ),
                ),
              );
            }, 
            );
        }),
       ],
      ),
     );
    
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
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
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.54,
      child: Column(
        children: <Widget>[
          Image.network(image,width:size.width*0.54, height: 230,
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
