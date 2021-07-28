import 'dart:io';

import 'package:anubiss/services/storage.dart';
import 'package:anubiss/widgets/customText.dart';
import 'package:anubiss/widgets/customtextFormField.dart';
import 'package:anubiss/widgets/phoneBox.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageBox extends StatefulWidget {
  late Size size;

  ImageBox({required this.size});
  @override
  _ImageBoxState createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  TextEditingController controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File selectedImage = File("");
  //remove it
  StorageServices services = StorageServices();
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
        width: widget.size.width / 1.1,
        height: widget.size.height / 2.5,
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
                        width: widget.size.height / 8,
                        height: widget.size.height / 8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(selectedImage),
                          ),
                          border: Border.all(
                            color: Color(0xff2F3A73),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: selectedImage.path.isEmpty
                            ? Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/flat-contact-us-background_23-2148179809.png",
                                ),
                              )
                            : SizedBox()),
                    Transform.translate(
                      offset: Offset(
                        widget.size.height / 12,
                        widget.size.height / 12,
                      ),
                      child: Container(
                        height: widget.size.height / 20,
                        width: widget.size.height / 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Color(0xff2F3A73),
                          ),
                        ),
                        child: Transform.translate(
                          offset: Offset(
                            -widget.size.height / 180,
                            -widget.size.height / 180,
                          ),
                          child: IconButton(
                            onPressed: () async {
                              XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              if (image!.path.isEmpty) {
                                print("user cancel");
                              } else {
                                setState(() {
                                  selectedImage = File(image.path);
                                  print("user choose image ");
                                });
                              }
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: Color(0xff2F3A73),
                              size: widget.size.height / 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                height: widget.size.height / 7,
              ),
            ),
            CustomTextFormFeild(
              controller: controller,
              hint: "الاسم",
            ),
            SizedBox(height: widget.size.height / 30),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await services.uploadFile(
                    selectedImage.path,
                    PhoneBox.controller.text.trim(),
                  );
                  print(PhoneBox.controller.text.trim());
                },
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
                      widget.size.width / 2.5,
                      widget.size.width / 9,
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
