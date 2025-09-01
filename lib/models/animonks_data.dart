// models/animonks_data.dart

class AnimonksData {
  final int week;
  final String animal;
  final String image;
  final List<DayData> days;

  AnimonksData({
    required this.week,
    required this.animal,
    required this.image,
    required this.days,
  });

  factory AnimonksData.fromJson(Map<String, dynamic> json) {
    return AnimonksData(
      week: json['week'] as int,
      animal: json['animal'] as String,
      image: json['image'] as String,
      days: (json['days'] as List)
          .map((e) => DayData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DayData {
  final String day;
  final String type;
  final String gratitudePrompt;
  final String learn;
  final String pray;

  DayData({
    required this.day,
    required this.type,
    required this.gratitudePrompt,
    required this.learn,
    required this.pray,
  });

  factory DayData.fromJson(Map<String, dynamic> json) {
    return DayData(
      day: json['day'] as String,
      type: json['type'] as String,
      gratitudePrompt: json['Gratitude Prompt'] as String,
      learn: json['Learn'] as String,
      pray: json['Pray'] as String,
    );
  }
}
