
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'AdminHome.dart';

class ListStudents extends StatelessWidget {
  static const String id='get_student';
//
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back,

              ),
              onPressed: () { },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        //centerTitle: true,
        title: Text('List Of Students',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'OpenSans',

          ),
        ),
        actions: <Widget>[
          Center(
            child: Icon(Icons.search,
                color: Colors.black),
          ),
          SizedBox(width: 20.0),
          Center(
            child: Icon(Icons.logout,
                color: Colors.black),
          ),
          SizedBox(width: 20.0),

        ],
      ),
      body: ListView.separated(
          itemBuilder: (context,index) => buildListUserItem(),
          separatorBuilder: (context,index)=>Divider(),
          itemCount: 10),
    );
  }
}

@override
Widget buildListUserItem() {
  return Column(

    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(

          child: new FittedBox(
            child: Material(
                color: Colors.white,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        // child: myDetailsContainer4(),
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 100,


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,



                        children: [
                          Column(
                            children: [
                              SizedBox(height:30,),
                              Text('Wael et Eya ',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto', fontStyle:FontStyle.italic
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: Text(
                                  "Software engineers",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12.0,

                                  ),
                                ),
                              ),
                            ],
                          ),

                          ClipRRect(
                            borderRadius: new BorderRadius.circular(15.0),
                            child: Image(
                              fit: BoxFit.cover,
                              alignment: Alignment.topRight,
                              image: NetworkImage('https://i.ibb.co/100PgNw/2.png',
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: Row(
      //     children: [
      //       CircleAvatar(
      //         radius: 25.0,
      //         backgroundImage: NetworkImage('https://i.ibb.co/100PgNw/2.png'),
      //       ),
      //       SizedBox(
      //         width: 15.0,
      //       ),
      //       Text('Eya & Wael',
      //         style: TextStyle(
      //           fontSize: 18.0,
      //           fontFamily: 'Roboto',
      //
      //
      //         ),)
      //     ],
      //   ),
      // ),
    ],
  );
  }

