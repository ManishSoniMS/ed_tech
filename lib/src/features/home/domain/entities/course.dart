import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'about_course.dart';

class Course extends Equatable {
  final String id;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final List<AboutCourse> about;
  final int duration;
  final List<String> language;
  final String title;
  final List<String> type;
  final int validity;
  final int price;
  final String image;

  const Course({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.about,
    required this.duration,
    required this.language,
    required this.title,
    required this.type,
    required this.validity,
    required this.price,
    required this.image,
  });

  @override
  String toString() => 'Course{ id: $id, createdAt: $createdAt, '
      'updatedAt: $updatedAt, about: $about, duration: $duration, '
      'language: $language, title: $title, type: $type, '
      'validity: $validity, price: $price, image: $image,}';

  Course copyWith({
    String? id,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    List<AboutCourse>? about,
    int? duration,
    List<String>? language,
    String? title,
    List<String>? type,
    int? validity,
    int? price,
    String? image,
  }) {
    return Course(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      about: about ?? this.about,
      duration: duration ?? this.duration,
      language: language ?? this.language,
      title: title ?? this.title,
      type: type ?? this.type,
      validity: validity ?? this.validity,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'about': about,
      'duration': duration,
      'language': language,
      'title': title,
      'type': type,
      'validity': validity,
      'price': price,
      'image': image,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      about: List<AboutCourse>.from(
          map['about'].map((e) => AboutCourse.fromMap(e))),
      duration: map['duration'],
      language: List<String>.from(map['language']),
      title: map['title'],
      type: List<String>.from(map['type']),
      validity: map['validity'],
      price: map['price'],
      image: map['image'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        about,
        duration,
        language,
        title,
        type,
        validity,
        price,
        image,
      ];
}
