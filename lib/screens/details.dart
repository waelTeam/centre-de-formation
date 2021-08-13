import 'package:centredeformation/models/addF.dart';
import 'package:centredeformation/services/constantsF.dart';
import 'package:centredeformation/services/store.dart';
import 'package:centredeformation/widgets/badge.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../util/data.dart';
import '../util/const.dart';
import '../widgets/formation_item.dart';

class Details extends StatefulWidget {
  static String id = 'details';

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _store = Store();
  List<Formation> _formations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // Center(
          //   child: IconBadge(
          //     icon: Feather.shopping_cart,
          //   ),
          // ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(height: 10.0),
              buildImage(),
              SizedBox(height: 20.0),
              StreamTitle(),
              SizedBox(height: 10.0),
              Text(
                "\$550.00",
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Sed porttitor lectus nibh. Cras ultricies ligula "
                "sed magna dictum porta. Praesent sapien massa, "
                "convallis a pellentesque nec, egestas non nisi. "
                "Lorem ipsum dolor sit amet, consectetur adipiscing "
                "elit. Nulla porttitor accumsan tincidunt. "
                "Curabitur arcu erat, accumsan id imperdiet et, "
                "porttitor at sem.",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Photos",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              buildProductList(),
              SizedBox(height: 10.0),
            ],
          ),
          buildFloatingButton(),
        ],
      ),
    );
  }

  buildProductList() {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: furnitures.length,
        itemBuilder: (BuildContext context, int index) {
          Map furniture = furnitures.reversed.toList()[index];

          return ProductItem(
            furniture: furniture,
          );
        },
      ),
    );
  }

  buildFloatingButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).accentColor,
            boxShadow: [
              BoxShadow(
                color: Colors.orange.shade200,
                offset: Offset(0.0, 10.0),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Feather.plus,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ),
      ),
    );
  }

  buildImage() {
    return Container(
      height: 240.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "${furnitures[0]["img"]}",
              height: 240.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: -10.0,
            bottom: 3.0,
            child: RawMaterialButton(
              onPressed: () {},
              fillColor: Colors.white,
              shape: CircleBorder(),
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Feather.heart,
                  color: Theme.of(context).accentColor,
                  size: 17.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget StreamTitle() {

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(kformationCollection)
            .snapshots(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Text('loading data ..please wait');
          return Text(

            snapshot.data.docs[0][kformationName],

            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w900,
            ),
          );
        });
  }

  // Widget StreamTitle() {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: _store.loadFormations(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         List<Formation> formations = [];
  //
  //           formations.add(Formation(
  //               fId: kformationId,
  //               fPrice: kformationPrice,
  //               fTitle: kformationName,
  //               fDetails: kformationDescription,
  //               fAdress: kformationAddress,
  //               fCategory: kformationCategory));
  //
  //         _formations = [..._formations];
  //
  //
  //         return GridView.builder(
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             childAspectRatio: .8,
  //           ),
  //
  //         );
  //       } else {
  //         return Center(child: Text('Loading...'));
  //       }
  //     },
  //   );
  // }


}
