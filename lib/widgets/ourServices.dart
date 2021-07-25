import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../urls.dart';
import 'customText.dart';

class OurServices extends StatelessWidget {
  const OurServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Stack(
              children: [
                Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/anubis-a770f.appspot.com/o/Artboard%20%E2%80%93%201.png?alt=media&token=016fc2ce-b7e2-41bd-b784-dd30bed171ac"),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.01),
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
                  "خدماتنا",
                  style: TextStyle(
                    color: Color(0xff2F3A73),
                    fontSize: size.height * 0.014,
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
          Container(
            color: Colors.transparent,
            height: size.height * 0.56,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customCont(
                      size: size,
                      tiitle: "استضافة مواقع",
                      photo: hostphoto,
                    ),
                    customCont(
                      size: size,
                      tiitle: "تصميم مواقع",
                      photo: webDesign,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customCont(
                      size: size,
                      tiitle: "تطبيقاتandroid&IOS\n   ",
                      photo: appDev,
                    ),
                    customCont(
                      size: size,
                      tiitle: "برامج الحسابات\n والادارات",
                      photo: managmentPhoto,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customCont(
      {required Size size, required String tiitle, required String photo}) {
    return Container(
      height: size.height / 3.9,
      width: size.width / 2.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff2F3A73),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image(
              image: NetworkImage(
                photo,
              ),
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            width: size.width / 4,
            height: size.width / 4,
          ),
          CustomText(
            title: tiitle,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: size.height / 50,
          )
        ],
      ),
    );
  }
// height: size.height * 0.56,
}
