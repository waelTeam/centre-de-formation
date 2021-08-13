//import 'package:flutter/cupertino.dart';
import 'package:centredeformation/models/addA.dart';
import 'package:centredeformation/screens/formateur/AdminHome.dart';
import 'package:centredeformation/screens/shared/components/components.dart';
import 'package:centredeformation/services/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class AddAnnonce extends StatelessWidget {
  static String id = 'AddFormationA';
  String _nameA, _imageA, _descriptionA, _categoryA, _addressA,_contactA;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pushNamed(context,AdminHome.id);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Text('Add Announcement',
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
        ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _globalKey,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter the title of the course';
                  }
                },
                onChange: (value) {
                  _nameA = value;
                },
                label: 'title',
                prefix: Icons.add,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter some details';
                  }
                },
                onChange: (value) {
                  _descriptionA = value;
                },
                label: 'details',
                prefix: Icons.add,
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter the address';
                  }
                },
                onChange: (value) {
                  _addressA= value;
                },
                label: 'address',
                prefix: Icons.add,
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter a contact';
                  }
                },
                onChange: (value) {
                  _contactA = value;
                },
                label: 'contact',
                prefix: Icons.add,
              ),
            ),


            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please add a picture';
                  }
                },
                onChange: (value) {
                  _imageA= value;
                },
                label: 'picture',
                prefix: Icons.add,
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter the category';
                  }
                },
                onChange: (value) {
                  _categoryA = value;
                },
                label: 'category',
                prefix: Icons.add,
              ),
            ),

            SizedBox(
              height: 20,
            ),
            // ElevatedButton.icon(
            //   style: ElevatedButton.styleFrom(
            //     shadowColor: Color.fromRGBO(143, 148, 251, 1),
            //     primary:Color.fromRGBO(143, 148, 251,6),
            //     onPrimary: Colors.white,
            //     minimumSize: Size(250,40),
            //     elevation: 4,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(50)
            //     ),
            //
            //   ),
            //   icon: FaIcon(FontAwesomeIcons.plus,color:Colors.purple.shade50,size:14),
            //   label: Text('Add'),
            //   onPressed: () {
            //     //Navigator.pushNamed(context, AddFormaton.id);
            //   },
            // ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                if (_globalKey.currentState.validate()) {
                  _globalKey.currentState.save();
                  _store.addAnnonce(Annonce(
                      ATitle: _nameA,
                      ADetails: _descriptionA,
                      AContact: _contactA,
                      AImage: _imageA,
                      Adress: _addressA,
                      ACategory: _categoryA
                  ));
                }

              },
              child: Text('Add',style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
