import 'dart:convert';

List<Model> modelFromJson(String str) =>
    List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  Model({
    required this.name,
    required this.age,
    required this.gender,
    required this.hairColor,
  });

  String name;
  String age;
  String gender;
  String hairColor;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        hairColor: json["hairColor"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "gender": gender,
        "hairColor": hairColor,
      };
}
