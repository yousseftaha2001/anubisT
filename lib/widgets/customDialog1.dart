import 'dart:io';

import 'package:anubiss/widgets/customText.dart';
import 'package:anubiss/widgets/profile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  late String title;
  late String date;
  late String price;
  late String notes;
  late int index;

  CustomAlertDialog({
    required this.title,
    required this.date,
    required this.price,
    required this.notes,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Color(0xff2F3A73), width: 3),
      ),
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: title,
              color: Color(0xff2F3A73),
              fontWeight: FontWeight.bold,
              fontSize: size.height / 35,
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                
                Navigator.pop(context);
              },
              icon: Icon(EvaIcons.close),
            ),
          ],
        ),
      ),
      children: [
        Container(
          width: size.width,
          height: size.height / 3.4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Table(
                  border: TableBorder.all(
                    color: Color(0xff2F3A73),
                    width: 2,
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      children: [
                        SizedBox(
                          height: size.height / 20,
                          child: Center(
                            child: CustomText(
                              title: "20/2/2020",
                              color: Color(0xff2F3A73),
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 40,
                            ),
                          ),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        SizedBox(
                          height: size.height / 20,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CustomText.direction(
                              title: "الدفع:",
                              color: Color(0xff2F3A73),
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 40,
                              left: false,
                            ),
                          ),
                        )
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      children: [
                        SizedBox(
                          height: size.height / 20,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CustomText.direction(
                              title: "الملاحظات:",
                              color: Color(0xff2F3A73),
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 40,
                              left: false,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: Container(
                  height: size.height / 15,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customStep(
                        size: size,
                        title: "التصميم",
                        state: true,
                        index: 0,
                      ),
                      customStep(
                        size: size,
                        title: "تكويد",
                        state: true,
                        index: 1,
                      ),
                      customStep(
                        size: size,
                        title: "اختبار",
                        state: false,
                        index: 2,
                      ),
                      customStep(
                        size: size,
                        title: "استلام",
                        state: false,
                        index: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //---------------------------------------//
  Widget customStep({
    required bool state,
    required String title,
    required Size size,
    required int index,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  state ? Color(0xff2F3A73).withAlpha(150) : Colors.grey,
              radius: size.height / 60,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: state ? Color(0xff2F3A73) : Colors.white,
                  radius: size.height / 120,
                ),
              ),
            ),
            index != 3
                ? Container(
                    color: state ? Color(0xff2F3A73) : Colors.grey,
                    height: size.height * 0.005,
                    width: size.width * 0.13,
                  )
                : SizedBox(),
          ],
        ),
        CustomText(
          title: title,
          color: Color(0xff2F3A73),
          fontWeight: FontWeight.bold,
          fontSize: size.height / 60,
        )
      ],
    );
  }
}
