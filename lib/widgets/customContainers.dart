import 'package:flutter/material.dart';

import 'customText.dart';

class CustomContainer extends StatefulWidget {
  late Size size;
  late String title;
  late String title2;
  late String title3;
  late bool isTaped;

  CustomContainer(
      {required this.isTaped,
      required this.size,
      required this.title,
      required this.title2,
      required this.title3});

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height / 3.5,
      width: widget.size.width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.isTaped ? Color(0xffFEC46B) : Colors.white38,
        border: Border.all(
          width: widget.isTaped ? 0 : 1,
          color: Color(0xffE78F0B),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: widget.size.height / 40),
          Material(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              child: Image(
                image: AssetImage("assets/images/appdev.png"),
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              width: widget.size.width / 6,
              height: widget.size.width / 6,
            ),
          ),
          SizedBox(height: widget.size.height / 40),
          Material(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: widget.size.width / 4,
              height: widget.size.height / 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Center(
                child: CustomText(
                  title: widget.title,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.height / 57,
                ),
              ),
            ),
          ),
          SizedBox(height: widget.size.height / 60),
          Material(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: widget.size.width / 4,
              height: widget.size.height / 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Center(
                child: CustomText(
                  title: widget.title2,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.height / 57,
                ),
              ),
            ),
          ),
          SizedBox(height: widget.size.height / 60),
          Material(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: widget.size.width / 4,
              height: widget.size.height / 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Center(
                child: CustomText(
                  title: widget.title3,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.size.height / 57,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
