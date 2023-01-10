import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              padding: EdgeInsets.all(8),
              width: 60,
              height: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 3))
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Image.asset("images/drink.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              width: 60,
              height: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 3))
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Image.asset("images/salan.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              width: 60,
              height: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 3))
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Image.asset("images/biryani.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              width: 60,
              height: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 3))
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Image.asset("images/burger.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              width: 60,
              height: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 3))
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Image.asset("images/pizza.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              width: 60,
              height: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 3))
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Image.asset("images/salan.png"),
            ),
          ),
        ]),
      ),
    );
  }
}
