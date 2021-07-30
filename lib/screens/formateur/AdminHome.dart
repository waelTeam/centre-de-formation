import 'package:centredeformation/main.dart';
import 'package:centredeformation/screens/welcome_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_formation.dart';
import 'list_students.dart';
import 'add_formation_annonce.dart';

class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';
  final String assetToDo= 'assets/images/ToDo.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () { Navigator.pushNamed(context,WelcomeScreen.id);},
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Text('',
          style: TextStyle(
              fontSize: 20.0
          ),
        ),
        actions: <Widget>[
          Center(
            child: Icon(Icons.logout),
          ),
          SizedBox(width: 20.0),
        ],
      ),//
      backgroundColor: Colors.white,
      body: Container(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
            ),

            Expanded(
              child: SvgPicture.asset(
                assetToDo,
                semanticsLabel: 'Acme Logo',
                height: 180,
              ),
            ),


           Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shadowColor: Color.fromRGBO(143, 148, 251, 1),
                primary:Color.fromRGBO(143, 148, 251,6),
                onPrimary: Colors.white,
                minimumSize: Size(250,40),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
              //
              icon: FaIcon(FontAwesomeIcons.plus,color:Colors.purple.shade50,size:14),
              label: Text('Add Formation'),
              onPressed: () {
               Navigator.pushNamed(context, AddFormation.id);
             },
            ),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shadowColor: Color.fromRGBO(143, 148, 251, 1),
                  primary:Color.fromRGBO(143, 148, 251,6),
                  onPrimary: Colors.white,
                  minimumSize: Size(250,40),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),

                ),
                icon: FaIcon(FontAwesomeIcons.listAlt,color:Colors.purple.shade50,size:14),
                label: Text('View Students List'),
                onPressed: () {
                  Navigator.pushNamed(context, ListStudents.id);
                },
              ),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shadowColor: Color.fromRGBO(143, 148, 251, 1),
                  primary:Color.fromRGBO(143, 148, 251,6),
                  onPrimary: Colors.white,
                  minimumSize: Size(250,40),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),

                ),
                icon: FaIcon(FontAwesomeIcons.plus,color:Colors.purple.shade50,size:14),
                label: Text('add Announcement'),
                onPressed: () {
                  Navigator.pushNamed(context, AddAnnonce.id);
                },
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shadowColor: Color.fromRGBO(143, 148, 251, 1),
                  primary:Color.fromRGBO(143, 148, 251,6),
                  onPrimary: Colors.white,
                  minimumSize: Size(250,40),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),

                  ),
                ),
                icon: FaIcon(FontAwesomeIcons.userEdit,color:Colors.purple.shade50,size:14),
                label: Text('Edit profile'),
                onPressed: () {
                  //Navigator.pushNamed(context, ListEtudiant.id);
                },
              ),
              ],),

          ],
        ),
      ),
    );
  }
}