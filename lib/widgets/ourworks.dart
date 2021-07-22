
import 'package:flutter/material.dart';

import 'customText.dart';

class OurWorks extends StatefulWidget {
  const OurWorks({Key? key}) : super(key: key);

  @override
  _OurWorksState createState() => _OurWorksState();
}

class _OurWorksState extends State<OurWorks> {
  bool web = true;
  bool mobile = false;

  void changeButtonstate() {
    setState(() {
      web = !mobile;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: size.width / 1.5,
                height: size.height / 5,
                child: Image(image: AssetImage("assets/images/team.png")),
              ),
              Container(
                child: Column(
                  children: [
                    CustomText(
                      title: "اهم اعمالنا",
                      color: Color(0xff2F3A73),
                      fontWeight: FontWeight.bold,
                      fontSize: size.height / 60,
                    ),
                    Container(
                      color: Color(0xffE78F0B),
                      height: size.height * 0.002,
                      width: size.width * 0.2,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          web = true;
                          mobile = false;
                        });
                      },
                      child: CustomText(
                        title: "Web",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(20.00),
                        shadowColor: web
                            ? MaterialStateProperty.all<Color>(
                                Color(0xffE78F0B),
                              )
                            : MaterialStateProperty.all(Colors.grey),
                        backgroundColor: web
                            ? MaterialStateProperty.all<Color>(
                                Color(0xffE78F0B),
                              )
                            : MaterialStateProperty.all(Colors.grey),
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(
                            size.width / 4,
                            size.width / 12,
                          ),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          web = false;
                          mobile = true;
                        });
                      },
                      child: CustomText(
                        title: "mobile",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(15.00),
                        shadowColor: mobile
                            ? MaterialStateProperty.all<Color>(
                                Color(0xffE78F0B))
                            : MaterialStateProperty.all(Colors.grey),
                        backgroundColor: mobile
                            ? MaterialStateProperty.all<Color>(
                                Color(0xffE78F0B))
                            : MaterialStateProperty.all(Colors.grey),
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(
                            size.width / 4,
                            size.width / 12,
                          ),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: size.width / 1.2,
            height: size.height / 1.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xffE78F0B), width: 2),
            ),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    print("tap");
                  },
                  child: Container(
                    width: size.width / 3,
                    height: size.width / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/best_webdesign_template_1920.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
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
