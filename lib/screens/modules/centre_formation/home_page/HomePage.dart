import 'dart:ui';

import 'package:centredeformation/screens/layout/centre_app/cubit/cubit.dart';
import 'package:centredeformation/screens/layout/centre_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/course.dart';
import '../courses_category/courses_category.dart';
import '/util/assets.dart';
import '../../../details/components/constants.dart';

class HomePage extends StatelessWidget {
  static const String id = 'Home_Page';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CentreCubit, CentreStates>(
      listener: (context, state) {},
      builder: (context,state){
       return  Scaffold(
          body: Stack(
            children: [
              background(),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      header(),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "What are you looking for?",
                          style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      search(),
                      Container(
                        height: 220,
                        child: Padding(
                          padding: const EdgeInsets.only(left :10.0),
                          child: ListView.separated(

                            separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                              width: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: Assets.menuCourse.length,
                            itemBuilder: (context, index) {
                              Map map = Assets.menuCourse[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CoursesCategory(map: map),
                                      ),
                                    ),
                                  );
                                },
                                child: itemGrid(
                                    map['image'], map['title'], map['modul']),
                              );
                            },
                            padding: EdgeInsets.only(bottom: 10),
                          ),
                        ),
                      ),


                      SizedBox(height: 16),
                      titleList('Course on Progress (2)', () {}),
                      listOnProgress(),
                      SizedBox(height: 16),
                      titleList('Professor', () {}),
                      SizedBox(height: 16),
                      listProfesor(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget listProfesor() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: Assets.profesors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String imageProf = Assets.profesors[index];
          return Container(
            margin: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == Assets.profesors.length - 1 ? 16 : 8,
              0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 6,
                  color: Colors.black38,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageProf,
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget titleList(String title, Function function) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            child: Icon(Icons.navigate_next),
            onTap: () => function,
          ),
        ],
      ),
    );
  }

  Widget listOnProgress() {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.all(16),
      physics: NeverScrollableScrollPhysics(),
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
            color:Color(0xFF5894c6),
           // color:Color(0xFF3a7cb0),
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
                    onTap: () {},
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

  Widget itemGrid(String image, String title, int modul) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 6,
            color: Colors.black38,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$modul Modul',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget search() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search..',
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.indigo[900],
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(0),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.indigo[900],
          ),
          IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.indigo[900],
                size: 30,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              Assets.imageAvatar,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  Widget background() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xFF3f81b7),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}