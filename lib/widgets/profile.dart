import 'package:anubiss/models/projectModel.dart';
import 'package:anubiss/widgets/customContainers.dart';
import 'package:anubiss/widgets/customDialog1.dart';
import 'package:anubiss/widgets/customText.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../urls.dart';

class Profile extends StatefulWidget {
  String userName = "يوسف";
  String userPhone = "01140972520";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _userNameCont = TextEditingController();
  TextEditingController _userPhoneCont = TextEditingController();
  bool editMode = false;
  bool isTaped = false;

  @override
  void initState() {
    super.initState();
    _userNameCont.text = widget.userName;
    _userPhoneCont.text = widget.userPhone;
  }

  List<Project> projects = [
    Project(isTaped: false, title: "first", date: "22/2/2020", pid: "2"),
    Project(isTaped: false, title: "first", date: "22/2/2020", pid: "2"),
    Project(isTaped: false, title: "first", date: "22/2/2020", pid: "2"),
    Project(isTaped: false, title: "first", date: "22/2/2020", pid: "2"),
  ];
  changeValue(int index, bool val) {
    projects[index].isTaped = val;
    for (int i = 0; i < projects.length; i++) {
      if (i != index) {
        projects[i].isTaped = false;
      }
    }
  }

  setAll() {
    for (int i = 0; i < projects.length; i++) {
      projects[i].isTaped = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          setAll();
        });
      },
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: size.height / 40),
            customDivider("الحساب الشخصى", size),
            SizedBox(height: size.height / 40),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.height / 10,
                        height: size.height / 10,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffE78F0B),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/flat-contact-us-background_23-2148179809.png",
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(size.height / 15, size.height / 18),
                        child: Container(
                          height: size.height / 25,
                          width: size.height / 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                              color: Color(0xffE78F0B),
                            ),
                          ),
                          child: Transform.translate(
                            offset:
                                Offset(-size.height / 180, -size.height / 180),
                            child: IconButton(
                              onPressed: () {
                                print("edit");
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Color(0xffE78F0B),
                                size: size.height / 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  customTextField(
                    editingController: _userNameCont,
                    hint: "الاسم",
                  ),
                  customTextField(
                    editingController: _userPhoneCont,
                    hint: "رقم الموبايل",
                  ),
                  editMode
                      ? ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xffE78F0B)),
                              ),
                              child: CustomText(
                                title: "Update",
                                fontSize: size.height / 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  editMode = false;
                                  _userNameCont.text = widget.userName;
                                  _userPhoneCont.text = widget.userPhone;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xffE78F0B)),
                              ),
                              child: CustomText(
                                title: "Cancel",
                                fontSize: size.height / 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
              height: editMode ? size.height / 2.9 : size.height / 4,
              width: size.width / 1.2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffE78F0B),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: size.height / 40),
            customDivider("المشاريع", size),
            SizedBox(height: size.height / 40),
            Container(
              height: size.height / 3,
              width: size.width,
              child: ListView.builder(
                itemCount: projects.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeValue(index, true);
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => CustomAlertDialog(
                            title: projects[index].title,
                            date: projects[index].date,
                            price: '',
                            notes: '',
                            index: index,
                          ),
                        );
                      });
                    },
                    child: CustomContainer(
                      size: size,
                      title: projects[index].title,
                      title2: projects[index].pid,
                      title3: projects[index].date,
                      isTaped: projects[index].isTaped,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //----------------------------------------//

  Widget customDivider(String title, Size size) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Color(0xffE78F0B),
            height: size.height * 0.002,
            width: size.width * 0.2,
          ),
          Text(
            title,
            style: TextStyle(
              color: Color(0xff2F3A73),
              fontSize: size.height / 50,
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
    );
  }

  Widget customTextField({
    required TextEditingController editingController,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: TextField(
        onTap: () {
          setState(() {
            editMode = true;
          });
        },
        style: TextStyle(color: Colors.grey, fontSize: 14),
        controller: editingController,
        cursorColor: Color(0xffE78F0B),
        textDirection: TextDirection.rtl,
        keyboardType:
            hint != "الاسم" ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(3),
          hintText:
              editingController.text.isEmpty ? hint : editingController.text,
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xffE78F0B)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xffE78F0B)),
          ),
        ),
      ),
    );
  }

  Widget customCont({
    required Size size,
    required String title,
    required String title2,
    required String title3,
  }) {
    return Container(
      height: size.height / 3.5,
      width: size.width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white38,
        border: Border.all(
          width: 1,
          color: Color(0xffE78F0B),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image(
              image: AssetImage("assets/images/appdev.png"),
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            width: size.width / 6,
            height: size.width / 6,
          ),
          Container(
            width: size.width / 4,
            height: size.height / 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.amber,
            ),
            child: Center(
              child: CustomText(
                title: title,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: size.height / 57,
              ),
            ),
          ),
          Container(
            width: size.width / 4,
            height: size.height / 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.amber,
            ),
            child: Center(
              child: CustomText(
                title: title2,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: size.height / 57,
              ),
            ),
          ),
          Container(
            width: size.width / 4,
            height: size.height / 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.amber,
            ),
            child: Center(
              child: CustomText(
                title: title3,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: size.height / 57,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
