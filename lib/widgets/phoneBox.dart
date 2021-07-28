import 'package:anubiss/services/auth.dart';
import 'package:anubiss/viewmodel/states.dart';
import 'package:anubiss/widgets/customtextFormField.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customText.dart';

class PhoneBox extends StatelessWidget {
  late Size size;
  static TextEditingController controller = TextEditingController();
  PhoneBox({required this.size});

  @override
  Widget build(BuildContext context) {
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
            CustomTextFormFeild(
              controller: controller,
              hint: "رقم الهاتف",
            ),
            SizedBox(height: size.height / 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (controller.text.trim().length < 11) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("please enter good number"),
                      ),
                    );
                  } else {
                    Provider.of<ManageState>(context, listen: false)
                        .changeState();
                    // Provider.of<AuthServices>(context, listen: false).signUser(
                    //   phone: controller.text.trim(),
                    //   context: context,
                    //   size: size,
                    // );
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
}
