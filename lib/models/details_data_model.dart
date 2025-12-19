import 'dart:convert';

class DetailsDataModel {
  final String name;
  final String title;
  final String text;
  final String img;
  final String time;
  final String prize;

  DetailsDataModel({
    required this.name,
    required this.title,
    required this.text,
    required this.img,
    required this.time,
    required this.prize,
  });

  // JSON map → Model
  factory DetailsDataModel.fromMap(Map<String, dynamic> map) {
    return DetailsDataModel(
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      img: map['img'] ?? '',
      time: map['time'] ?? '',
      prize: map['prize'] ?? '',
    );
  }

  // Model → Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'text': text,
      'img': img,
      'time': time,
      'prize': prize,
    };
  }

  // JSON string → List<DetailsDataModel>
  static List<DetailsDataModel> listFromJson(String source) {
    final List<dynamic> jsonList = json.decode(source);
    return jsonList.map((e) => DetailsDataModel.fromMap(e)).toList();
  }

  // List<DetailsDataModel> → JSON string
  static String listToJson(List<DetailsDataModel> list) {
    return json.encode(list.map((e) => e.toMap()).toList());
  }
}
