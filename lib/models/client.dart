import 'dart:convert';

class Client {
  Client({
    this.email = "",
    this.name = "",
    this.phone = "",
    this.photoUrl = "",
    this.uid = "",
  });

  String email;
  String name;
  String phone;
  String photoUrl;
  String uid;

  factory Client.fromJson(String str) => Client.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        email: json["email"] ?? "",
        name: json["name"] ?? "",
        phone: json["phone"] ?? "",
        photoUrl: json["photoUrl"] ?? "",
        uid: json["uid"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "phone": phone,
        "photoUrl": photoUrl,
        "uid": uid,
      };
}
