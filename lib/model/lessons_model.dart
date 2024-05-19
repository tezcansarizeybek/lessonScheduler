import 'dart:convert';

LessonsModel lessonsModelFromJson(String str) =>
    LessonsModel.fromJson(json.decode(str));

String lessonsModelToJson(LessonsModel data) => json.encode(data.toJson());

class LessonsModel {
  String ders;
  String gun;
  String saat;

  LessonsModel({
    required this.ders,
    required this.saat,
    required this.gun,
  });

  factory LessonsModel.fromJson(Map<String, dynamic> json) => LessonsModel(
        ders: json["ders"],
        saat: json["saat"],
        gun: json["gun"],
      );

  Map<String, dynamic> toJson() => {
        "ders": ders,
        "saat": saat,
        "gun": gun,
      };
}
