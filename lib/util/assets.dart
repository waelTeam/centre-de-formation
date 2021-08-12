import 'package:flutter/material.dart';
import 'package:centredeformation/screens/models/course.dart';

class Assets {
  static final imageAvatar = 'assets/logos/avatar.png';

  static final menuCourse = [
    {
      'title': 'Computer science',
      'image': 'assets/logos/computer.jpg',
      'modul': 4,
    },
    {
      'title': 'Developement',
      'image': 'assets/logos/development.jpg',
      'modul': 8,
    },
    {
      'title': 'Design',
      'image': 'assets/logos/design.png',
      'modul': 8,
    },
    {
      'title': 'Leadership',
      'image': 'assets/logos/leadership.png',
      'modul': 8,
    },
  ];

  static final profesors = [
    'assets/images/prof1.png',
    'assets/images/prof2.png',
    'assets/images/prof3.png',
    'assets/images/prof4.png',
  ];

  static final List<Course> courses = [
    Course(
      color: Colors.cyan[200],
      duration: '8 Hour 2 Min',
      image: 'assets/logos/logo_flutter.png',
      modul: 17,
      name: 'Flutter',
      type: ['Frontend'],
    ),
    Course(
      color: Colors.blue[200],
      duration: '8 Hour 2 Min',
      image: 'assets/logos/logo_dart.png',
      modul: 17,
      name: 'Dart',
      type: ['Frontend'],
    ),
    Course(
      color: Colors.green[200],
      duration: '8 Hour 2 Min',
      image: 'assets/logos/logo_androidstudio.png',
      modul: 17,
      name: 'Android Studio',
      type: ['Frontend'],
    ),
    Course(
      color: Colors.red[200],
      duration: '8 Hour 2 Min',
      image: 'assets/logos/logo_java.png',
      modul: 17,
      name: 'Java',
      type: ['Frontend', 'Backend'],
    ),
    Course(
      color: Colors.orange[200],
      duration: '8 Hour 2 Min',
      image: 'assets/logos/logo_kotlin.png',
      modul: 17,
      name: 'Kotlin',
      type: ['Frontend', 'Backend'],
    ),
    Course(
      color: Colors.indigo[200],
      duration: '8 Hour 2 Min',
      image: 'assets/logos/logo_php.png',
      modul: 17,
      name: 'Php',
      type: ['Backend'],
    ),
  ];
}
