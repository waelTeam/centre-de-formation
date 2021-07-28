import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../util/data.dart';
import '../widgets/badge.dart';
import '../widgets/product_item_fav.dart';
import '../widgets/room_item.dart';
import '../widgets/search_card.dart';

class Favoris extends StatefulWidget {
  @override
  _FavorisState createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(
            child: IconBadge(
              icon: Feather.shopping_cart,
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SearchCard(),
          ),
          SizedBox(height: 30.0),
          //buildRoomList(),
          SizedBox(height: 20.0),
          buildTitleRow(),
          Expanded(child:buildProductList() ),

          //SizedBox(height: 10.0),
        ],
      ),
    );
  }
  //
  // buildRoomList() {
  //   return Container(
  //     height: 275,
  //     child: ListView.builder(
  //       scrollDirection: Axis.vertical,
  //       shrinkWrap: true,
  //       itemCount: furnitures.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Map furniture = furnitures[index];
  //
  //         return RoomItem(
  //           furniture: furniture,
  //         );
  //       },
  //     ),
  //   );
  // }

  buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Popular Products",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "View More",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  buildProductList() {
    return Container(
      height: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: furnitures.length,
        itemBuilder: (BuildContext context, int index) {
          Map furniture = furnitures[index];

          return ProductItem(
            furniture: furniture,
          );
        },
      ),
    );
  }
}
