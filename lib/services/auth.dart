import 'package:anubiss/viewmodel/authMange.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthServices extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUser({
    required String phone,
    required BuildContext context,
    required Size size,
  }) async {
    try {
      var result = await _auth.verifyPhoneNumber(
        phoneNumber: "+20$phone",
        timeout: Duration(minutes: 2),
        verificationCompleted: (PhoneAuthCredential credential) {
          print("all is done");
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("The provided phone number is not valid."),
              ),
            );
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          await Provider.of<AuthManagment>(context, listen: false).codeSent(
            context: context,
            size: size,
            vr: verificationId,
          );
          print("code send fun has done");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
