import 'package:anubiss/services/auth.dart';
import 'package:anubiss/viewmodel/states.dart';
import 'package:anubiss/widgets/customText.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

class AuthManagment extends ChangeNotifier {
  bool scanCode = false;

  void changeScanCode() {
    scanCode = !scanCode;
    notifyListeners();
  }

  TextEditingController _code = TextEditingController();

  Future<void> codeSent({
    required BuildContext context,
    required Size size,
    required String vr,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
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
                        changeScanCode();
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
                      height: size.height / 10,
                    ),
                    Center(
                      child: CustomText(
                        title: "من فضلك ادخل الكود المرسل لك",
                        fontSize: size.height / 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2F3A73),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PinInputTextField(
                        controller: _code,
                        cursor: Cursor(
                          width: 2,
                          color: Color(0xff2F3A73),
                          radius: Radius.circular(1),
                          enabled: true,
                        ),
                        decoration: CirclePinDecoration(
                          strokeColorBuilder: PinListenColorBuilder(
                              Color(0xff2F3A73), Color(0xff2F3A73)),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 30),
                    Center(
                      child: Consumer<AuthManagment>(
                        builder: (context, data, child) {
                          if (data.scanCode) {
                            return CircularProgressIndicator();
                          } else {
                            return ElevatedButton(
                              onPressed: () async {
                                changeScanCode();
                                String result = await activeCode(
                                  code: _code.text.trim(),
                                  vri: vr,
                                );
                                if (result != 'error') {
                                  print("done reg");
                                  print(result);
                                  changeScanCode();
                                  Navigator.pop(context);
                                } else {
                                  print("error");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(result),
                                    ),
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
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff2F3A73)),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  Size(
                                    size.width / 2.5,
                                    size.width / 9,
                                  ),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );

  }

  Future<String> activeCode({required String code, required String vri}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: vri,
      smsCode: code,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCredential.user!.uid.isNotEmpty) {
      String uid = userCredential.user!.uid;
      return uid;
    } else {
      print("error");
      return "error";
    }
  }
}
