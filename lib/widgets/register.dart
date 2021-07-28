import 'package:anubiss/viewmodel/states.dart';

import 'package:anubiss/widgets/imageBox.dart';
import 'package:anubiss/widgets/phoneBox.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height / 8),
          Container(
            height: size.height / 2,
            width: size.width,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: size.height / 2,
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
                      return PhoneBox(size: size);
                    } else {
                      return ImageBox(size: size);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
