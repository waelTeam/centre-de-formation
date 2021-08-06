import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'package:centredeformation/screens/product/components/body.dart';

class getProfile extends StatelessWidget {
  static String id = 'getProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.indigo[300],
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,

      backgroundColor: Colors.indigo[300],
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/notification.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}
