import 'package:centredeformation/screens/liste_formation_category.dart';
import 'package:flutter/material.dart';

class GetStudent extends StatelessWidget {
  static const String id='get_student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context,index) => buildListUserItem(),
          separatorBuilder: (context,index)=>Divider(),
          itemCount: 10),
    );
  }
}

  @override
  Widget buildListUserItem() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage('https://i.ibb.co/100PgNw/2.png'),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text('Eya & Wael',
          style: TextStyle(
            fontSize: 18.0,
          ),)
        ],
      ),
    );
  }

