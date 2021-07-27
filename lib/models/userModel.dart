import 'package:anubiss/models/projectModel.dart';

class UserModel {
  late bool box;
  late bool mas;
  late String name;
  late String phoneId;
  late String photoUrl;

  UserModel({
    required this.box,
    required this.mas,
    required this.name,
    required this.phoneId,
    required this.photoUrl,
  });
  UserModel.fromJson(Map<String, dynamic> data) {
    box = data["box"];
    mas = data["mas"];
    name = data["name"];
    phoneId = data["phoneId"];
    photoUrl = data["photoUrl"];

  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "box": box,
      "mas": mas,
      "name": name,
      "phoneId": phoneId,
      "photoUrl": photoUrl,

    };
    return data;
  }
}
