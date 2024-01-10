import 'package:equatable/equatable.dart';

class AboutCourse extends Equatable {
  final String title;
  final String description;

  const AboutCourse({
    required this.title,
    required this.description,
  });

  @override
  String toString() =>
      'AboutCourse{ title: $title, description: $description,}';

  AboutCourse copyWith({
    String? title,
    String? description,
  }) {
    return AboutCourse(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory AboutCourse.fromMap(Map<String, dynamic> map) {
    return AboutCourse(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
      ];
}
