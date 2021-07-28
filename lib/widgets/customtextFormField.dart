import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  late TextEditingController controller;
  late String hint;
  CustomTextFormFeild({required this.controller, required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextField(
        style: TextStyle(color: Colors.grey, fontSize: 17),
        controller: controller,
        cursorColor: Color(0xff2F3A73),
        textDirection: TextDirection.rtl,
        keyboardType:
            hint != "الاسم" ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(15),
          hintText: controller.text.isEmpty ? hint : controller.text,
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
}
