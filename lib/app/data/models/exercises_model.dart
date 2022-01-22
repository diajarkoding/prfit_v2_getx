class Exercises {
  Exercises(
      {required this.name, required this.image, required this.tutorialList});

  Exercises.fromJson(Map<dynamic, dynamic> json)
      : this(
            name: json['name']! as String,
            image: json['image']! as String,
            tutorialList: json["tutorialList"] ?? []);

  final String name;
  final String image;
  final List tutorialList;

  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image, 'tutorialList': tutorialList};
  }
}
