import 'package:centredeformation/screens/modules/centre_formation/detail_course/details.dart';
import 'package:centredeformation/screens/shared/components/components.dart';
import 'package:centredeformation/screens/modules/centre_formation/my_courses_favoris/my_courses_favoris.dart';
import 'package:flutter/material.dart';
import '../../../models/course.dart';
import '/util/assets.dart';

class CoursesCategory extends StatelessWidget {
  final Map map;
  const CoursesCategory({this.map});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            map['image'],
            fit: BoxFit.cover,
            height: 300,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -3),
              blurRadius: 6,
              color: Colors.black54,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.6,
        child: listOnProgress(),
      ),
    );
  }
}

Widget listOnProgress() {
  return ListView.builder(
    itemCount: 6,
    shrinkWrap: true,
    padding: EdgeInsets.all(16),
    //physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      Course course = Assets.courses[index];
      return Container(
        margin: EdgeInsets.fromLTRB(
          0,
          index == 0 ? 0 : 8,
          0,
          index == 1 ? 0 : 8,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF3f81b7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  course.image,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      course.duration,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Material(
                borderRadius: BorderRadius.circular(100),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Details()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 40,
                      color: Colors.indigo[900],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
