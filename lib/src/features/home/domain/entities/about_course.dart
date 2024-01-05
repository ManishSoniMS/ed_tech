import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AboutCourse extends Equatable {
  final String title;
  final String description;

  const AboutCourse({
    required this.title,
    required this.description,
  });

  @override
  String toString() {
    return 'AboutCourse{ title: $title, description: $description,}';
  }

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

final List<AboutCourse> data = [
  const AboutCourse(
    title: "Lorem Ipsum 1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  ),
  const AboutCourse(
    title: "Lorem Ipsum 2",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  ),
];
