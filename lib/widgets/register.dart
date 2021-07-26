import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'customText.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size.height / 3,
                    width: size.width,
                    color: Colors.blue,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/contact-us-customer-service-illustration_2175-310.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: Color(0xff2F3A73),
                        ),
                      ),
                      width: size.width / 1.1,
                      height: size.height / 2.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              print("colse");
                            },
                            icon: Icon(EvaIcons.close),
                          ),
                          Container(
                            //logo
                            height: size.height / 12,

                          ),
                          SizedBox(height: size.height/20),
                          customTextField(
                            editingController: _phoneNumber,
                            hint: "رقم الهاتف",
                          ),
                          SizedBox(height: size.height/20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                print("send");
                              },
                              child: CustomText(
                                title: "ارسال",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5.00),
                                shadowColor:
                                MaterialStateProperty.all<Color>(Color(0xff2F3A73)),
                                backgroundColor:
                                MaterialStateProperty.all<Color>(Color(0xff2F3A73)),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  Size(
                                    size.width / 2.5,
                                    size.width / 10,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ],
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
        horizontal: 30,
      ),
      child: TextField(
        style: TextStyle(color: Colors.grey, fontSize: 17),
        controller: editingController,
        cursorColor:Color(0xff2F3A73),
        textDirection: TextDirection.rtl,
        keyboardType:
            hint != "الاسم" ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(15),
          hintText:
              editingController.text.isEmpty ? hint : editingController.text,
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color:Color(0xff2F3A73),width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xff2F3A73),width: 2),
          ),
        ),
      ),
    );
  }
}
