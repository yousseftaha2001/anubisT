

import 'package:anubiss/widgets/customText.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: size.width / 2,
                height: size.height / 6,
                child: Image(
                  image: AssetImage("assets/images/about_us.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    title: "من نحن ",
                    color: Color(0xff2F3A73),
                    fontWeight: FontWeight.bold,
                    fontSize: size.height / 40,
                  ),
                  Container(
                    color: Color(0xffE78F0B),
                    height: size.height * 0.002,
                    width: size.width * 0.2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        title: "هي شركة  ﻣﺘﺨﺼﺼﺔ ﻓﻰ ﺗﺼﻤﻴﻢ برﻣﺠﺔ",
                        color: Color(0xff949494),
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.013,
                      ),
                      CustomText(
                        title: ",اﻟﺬﻛﻴﺔ ﻣﻮاﻗﻊ اﻧﺘﺮﻧﺖ ﺑﺮﻣﺠﺔ ﺗﻄﺒﻴﻘﺎت اﻟﻬﻮاﺗﻒ",
                        color: Color(0xff949494),
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.013,
                      ),
                      RichText(
                        text: TextSpan(
                          text: " ﺗﺴﻮﻳﻖ اﻟﻤﻮاﻗع",
                          style: TextStyle(
                            color: Color(0xff949494),
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.013,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Color(0xffE78F0B),
                  height: size.height * 0.002,
                  width: size.width * 0.2,
                ),
                Text(
                  "المقترحات",
                  style: TextStyle(
                    color: Color(0xff2F3A73),
                    fontSize: size.height * 0.019,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  color: Color(0xffE78F0B),
                  height: size.height * 0.002,
                  width: size.width * 0.2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: editingController,
              textDirection: TextDirection.rtl,
              maxLines: 4,
              maxLength: 4,
              decoration: InputDecoration(
                hintText: "الرسالة",
                hintTextDirection: TextDirection.rtl,
                hintStyle: TextStyle(color: Color(0xff2F3A73)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xffE78F0B))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xffE78F0B))),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: CustomText(
                title: "ارسال",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5.00),
                shadowColor:
                    MaterialStateProperty.all<Color>(Color(0xffE78F0B)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffE78F0B)),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(
                    size.width / 2,
                    size.width / 8,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Color(0xffE78F0B),
                    height: size.height * 0.002,
                    width: size.width * 0.2,
                  ),
                  Text(
                    "تواصل معنا",
                    style: TextStyle(
                      color: Color(0xff2F3A73),
                      fontSize: size.height * 0.019,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    color: Color(0xffE78F0B),
                    height: size.height * 0.002,
                    width: size.width * 0.2,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: Stack(
              children: [
                Container(
                  height: size.height / 4,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Color(0xffE78F0B),
                    ),
                  ),
                  child: Column(

                    children: [
                      SizedBox(
                        height: size.height/35,
                      ),
                      Transform.translate(
                        offset: Offset(size.height / 3.5, size.height / 100),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  title: "العنوان",
                                  color: Color(0xffE78F0B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height / 50,
                                ),
                                CustomText(
                                  title: "الرحااااااب",
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: size.height / 60,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.location_pin,
                              color: Color(0xffE78F0B),
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(size.height / 5.5, size.height / 100),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  title: "البريد الالتكرونى",
                                  color: Color(0xffE78F0B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height / 50,
                                ),
                                CustomText(
                                  title: "anubispro12@gmail.com",
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: size.height / 70,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.email_outlined,
                              color: Color(0xffE78F0B),
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(size.height / 3.9, size.height / 40),
                        child: Row(
                          children: [
                            CustomText(
                              title: "0114097250",
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: size.height / 70,
                            ),
                            Icon(
                              Icons.call,
                              color: Color(0xffE78F0B),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(-size.height / 10, -size.height / 30),

                  // offset: Offset(-70,-24),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/boy.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customContainer(
      {required Size size,
      required String title,
      required String body,
      required String image}) {
    return Container(
      width: size.width / 1.3,
      height: size.height / 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2,
          color: Color(0xffE78F0B),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: size.height / 600),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: size.width / 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    title: title,
                    color: Color(0xff2F3A73),
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.023,
                  ),
                  RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      text: body,
                      style: TextStyle(
                          color: Color(0xff808080),
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.018),
                    ),
                  ),
                ],
              ),
              Container(
                width: size.width / 7.5,
                height: size.width / 7.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    width: 3,
                    color: Color(0xffE78F0B),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: size.width / 10,
                    height: size.width / 10,
                    child: Image(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        image,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
