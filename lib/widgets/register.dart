import 'package:anubiss/services/auth.dart';
import 'package:anubiss/viewmodel/authMange.dart';
import 'package:anubiss/viewmodel/states.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

import 'customText.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _userName = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneNumber.dispose();
    _userName.dispose();
    super.dispose();
  }

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
                  Consumer<ManageState>(
                    builder: (context, data, child) {
                      if (data.state) {
                        return sendCont(size: size);
                      } else {
                        return imageCont(size: size);
                      }
                    },
                  )
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
        cursorColor: Color(0xff2F3A73),
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
            borderSide: BorderSide(color: Color(0xff2F3A73), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xff2F3A73), width: 2),
          ),
        ),
      ),
    );
  }

  Widget sendCont({required Size size}) {
    return Center(
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
              child: Center(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/abunislogo.png"),
                ),
              ),
              height: size.height / 7,
            ),
            customTextField(
              editingController: _phoneNumber,
              hint: "رقم الهاتف",
            ),
            SizedBox(height: size.height / 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_phoneNumber.text.trim().length < 11) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("please enter good number"),
                      ),
                    );
                  } else {
                    Provider.of<AuthServices>(context, listen: false).signUser(
                      phone: _phoneNumber.text.trim(),
                      context: context,
                      size: size,
                    );
                  }
                },
                child: CustomText(
                  title: "ارسال",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5.00),
                  shadowColor: MaterialStateProperty.all<Color>(
                    Color(0xff2F3A73),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff2F3A73)),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(
                      size.width / 2.5,
                      size.width / 9,
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
    );
  }

  Widget imageCont({required Size size}) {
    return Center(
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
            Center(
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: size.height / 8,
                      height: size.height / 8,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffE78F0B),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/flat-contact-us-background_23-2148179809.png",
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        size.height / 12,
                        size.height / 12,
                      ),
                      child: Container(
                        height: size.height / 20,
                        width: size.height / 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Color(0xffE78F0B),
                          ),
                        ),
                        child: Transform.translate(
                          offset: Offset(
                            -size.height / 180,
                            -size.height / 180,
                          ),
                          child: IconButton(
                            onPressed: () async {
                              XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              print("edit");
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: Color(0xffE78F0B),
                              size: size.height / 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                height: size.height / 7,
              ),
            ),
            customTextField(
              editingController: _userName,
              hint: "الاسم",
            ),
            SizedBox(height: size.height / 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: CustomText(
                  title: "حفظ",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5.00),
                  shadowColor: MaterialStateProperty.all<Color>(
                    Color(0xff2F3A73),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff2F3A73)),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(
                      size.width / 2.5,
                      size.width / 9,
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
    );
  }
}
