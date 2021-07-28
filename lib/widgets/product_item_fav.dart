import 'package:flutter/material.dart';

import '../screens/details.dart';

class ProductItem extends StatelessWidget {
  final Map furniture;

  ProductItem({required this.furniture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details();
              },
            ),
          );
        },
        child: Row(
          children: [
            Container(
              height: 140,
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "${furniture["img"]}",
                  height: 140,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('Category'),
          ],
        ),
      ),
    );
  }
}
