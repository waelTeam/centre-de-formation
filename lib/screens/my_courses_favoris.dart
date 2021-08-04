import 'package:centredeformation/models/course.dart';
import 'package:centredeformation/screens/details.dart';
import 'package:centredeformation/util/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
////

class MyCourses extends StatefulWidget {
  const MyCourses({Key key}) : super(key: key);

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              Course course = Assets.courses[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child:Container(
                      margin: EdgeInsets.fromLTRB(
                        0,
                        index == 0 ? 0 : 8,
                        0,
                        index == 1 ? 0 : 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo[200],
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
                    ),
                  ),
                ),
              );
            },
          ),
        ),
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
          color: Colors.indigo[200],
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
