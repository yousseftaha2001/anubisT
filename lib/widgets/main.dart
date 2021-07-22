
import 'package:anubiss/widgets/customText.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
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
                  "نبذةعنا ورؤيتنا بتقديم الخدمات",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: size.width / 4,
                height: size.height / 12,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/anubis-a770f.appspot.com/o/programming-and-coding-web-concept-in-flat-style-vector.png?alt=media&token=30d18bbf-a6a0-4442-957d-87a742dac297"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    title:
                    ",افضل شركة برمجة وتصميم تطبيقات الأندرويد والآيفون",
                    color: Color(0xff2F3A73),
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.013,
                  ),
                  CustomText(
                    title:
                    "وكذلك عمل تصميمات احترافية للمواقع الالكترونية وتطويرها",
                    color: Color(0xff2F3A73),
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.013,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                      "مهما كانت أفكارك فنحن في شركتنا سنجعلها حقيقة وواقع أمام عينيك",
                      style: TextStyle(
                        color: Color(0xff2F3A73),
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.013,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          customContainer(
            size: size,
            title: "رسالتنا",
            body: "مراعاة التكامل والجودة في\n"
                " كل مانقوم بتطويره لتقديم\n"
                ".أفضل النتائج لعملائنا",
            image:
            "https://firebasestorage.googleapis.com/v0/b/anubis-a770f.appspot.com/o/web-design-brush.png?alt=media&token=fc40415c-8f3c-46b3-afb2-b972fe2ea956",
          ),
          SizedBox(height: size.height / 100),
          customContainer(
            size: size,
            title: "هدفنا",
            body: "نهدف لـ تطوير مجتمع الويب من\n"
                "خلال تقديم خدمات و حلول خاصة\n"
                ".فى مجال تقنية نظم المعلومات",
            image:
            "https://firebasestorage.googleapis.com/v0/b/anubis-a770f.appspot.com/o/economy-icon-sign-260nw-446656291.png?alt=media&token=924a9377-5887-4a34-bb4c-3769e612cc80",
          ),
          SizedBox(height: size.height / 100),
          customContainer(
            size: size,
            title: "استراتيجيتنا",
            body: "نسعى الى  تقديم خدمات البرمجة\n"
                "والتصميم والتسويق الالكتروني على\n"
                ".أعلى مستوى من الكفاءة والدقة",
            image:
            "https://firebasestorage.googleapis.com/v0/b/anubis-a770f.appspot.com/o/road-icon-on-white-background-vector-21154187.png?alt=media&token=17df9961-beeb-4d95-a13e-f791791bd458",
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
                          fontSize: size.height*0.018
                      ),
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
