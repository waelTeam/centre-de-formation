import 'package:centredeformation/models/addF.dart';
import 'package:centredeformation/screens/shared/components/components.dart';
import 'package:centredeformation/services/store.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'AdminHome.dart';

class AddFormation extends StatelessWidget {
  static String id = 'AddFormation';
  String _name, _video, _description, _address, _category, _imageLocation;
  String _price;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();
  final Uuid _id= Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AdminHome.id);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Add Training',
          style: TextStyle(fontSize: 20.0),
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
                  _name = value;
                },
                label: 'title',
                prefix: Icons.add,
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color:Colors.transparent),
            //         borderRadius: BorderRadius.all(Radius.circular(30)),
            //
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.transparent),
            //         borderRadius: BorderRadius.all(Radius.circular(30)),
            //       ),
            //       prefixIcon: Icon(Icons.add),
            //       hintText: 'Title of the course',
            //       filled: true ,
            //       fillColor: Colors.grey.shade200,
            //     ),
            //     onChanged: (value) {
            //       _price = value;
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter some details';
                  }
                },
                onChange: (value) {
                  _description = value;
                },
                label: 'Details',
                prefix: Icons.add,
              ),
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
                  _address = value;
                },
                label: 'address',
                prefix: Icons.add,
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value==null) {
                    return 'please add the price';
                  }
                },
                 onChange: (value) {
                   _price = value;
                 },
                label: 'Price',
                prefix: Icons.add,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please enter the link of youtube video';
                  }
                },
                onChange: (value) {
                  _video = value;
                },
                label: 'videos',
                prefix: Icons.add,
              ),
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
                  _imageLocation = value;
                },
                label: 'pictures',
                prefix: Icons.add,
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultFormField(
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'please add a Category';
                  }
                },
                onChange: (value) {
                  _category = value;
                },
                label: 'Category',
                prefix: Icons.add,
              ),
            ),



            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: defaultButton(
            //     width: 250,
            //     text: 'Add a training',
            //     isUpperCase: false,
            //     function: (){
            //       if(_globalKey.currentState.validate())
            //       {
            //         _globalKey.currentState.save();
            //         _store.addFormation(Formation(
            //             fTitle: _name,
            //             fDetails:_description ,
            //             fVideo: _video,
            //             fImage: _imageLocation,
            //             fAdress: _address,
            //             fCategory:_category
            //         ));
            //
            //       }
            //
            //     },
            //   ),
            // ),

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
                  _store.addFormation(Formation(
                      fId:  _id.v4(),
                      fTitle: _name,
                      fDetails: _description,
                      fVideo: _video,
                      fImage: _imageLocation,
                      fAdress: _address,
                      fPrice: _price,
                      fCategory: _category));
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
