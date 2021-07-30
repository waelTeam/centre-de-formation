//import 'package:flutter/cupertino.dart';
import 'package:centredeformation/screens/formateur/AdminHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class AddAnnonce extends StatelessWidget {
  static String id = 'AddFormationA';
  late String _name, _price, _description, _category, _imageLocation;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  //final _store = Store();
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
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Icon(Icons.add),
                  hintText: 'Title of the course',
                  filled: true ,
                  fillColor: Colors.grey.shade200,
                ),
                onChanged: (value) {
                  _price = value;
                },
              ),
            ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(30)),

            ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              prefixIcon: Icon(Icons.add),
              hintText: 'Details',
              filled: true ,
            fillColor: Colors.grey.shade200,
          ),
          onChanged: (value) {
            _price = value;
          },
          ),
        ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Icon(Icons.add),
                  hintText: 'address',
                  filled: true ,
                  fillColor: Colors.grey.shade200,
                ),
                onChanged: (value) {
                  _price = value;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Icon(Icons.add),
                  hintText: 'Contact',
                  filled: true ,
                  fillColor: Colors.grey.shade200,
                ),
                onChanged: (value) {
                  _price = value;
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Icon(Icons.add),
                  hintText: 'add pictures',
                  filled: true ,
                  fillColor: Colors.grey.shade200,
                ),
                onChanged: (value) {
                  _price = value;
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Icon(Icons.add),
                  hintText: 'Category',
                  filled: true ,
                  fillColor: Colors.grey.shade200,
                ),
                onChanged: (value) {
                  _price = value;
                },
              ),
            ),

            SizedBox(
              height: 20,
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
              label: Text('Add'),
              onPressed: () {
                //Navigator.pushNamed(context, AddFormaton.id);
              },
            ),
            // RaisedButton(
            //   color: Colors.purpleAccent
            //   ,
            //   onPressed: () {
            //     // if (_globalKey.currentState.validate()) {
            //     //   _globalKey.currentState.save();
            //     //
            //     //   _store.addProduct(Product(
            //     //       pName: _name,
            //     //       pPrice: _price,
            //     //       pDescription: _description,
            //     //       pLocation: _imageLocation,
            //     //       pCategory: _category));
            //     // }
            //   },
            //   child: Text('Add'),
            // )
          ],
        ),
      ),
    );
  }
}
