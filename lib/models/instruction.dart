part of 'explore_recipe.dart';

class Instruction {
  String imageUrl;
  String description;
  int durationInMinutes;

  Instruction(
      {required this.imageUrl,
      required this.description,
      required this.durationInMinutes});

  factory Instruction.fromJSON(Map<String, dynamic> json) {
    return Instruction(
        imageUrl: json['imageUrl'] ?? '',
        description: json['description'] ?? '',
        durationInMinutes: json['durationInMinutes'] ?? '');
  }
}
