import 'package:equatable/equatable.dart';

class Teachers extends Equatable {
  final String id;
  final String name;
  final String image;
  final String subject;
  final List<String> courses;

  const Teachers({
    required this.id,
    required this.name,
    required this.image,
    required this.subject,
    required this.courses,
  });

  @override
  String toString() => 'Teachers{ id: $id, name: $name, '
      'image: $image, subject: $subject, courses: $courses,}';

  Teachers copyWith({
    String? id,
    String? name,
    String? image,
    String? subject,
    List<String>? courses,
  }) {
    return Teachers(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      subject: subject ?? this.subject,
      courses: courses ?? this.courses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'subject': subject,
      'courses': courses,
    };
  }

  factory Teachers.fromMap(Map<String, dynamic> map) {
    return Teachers(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      subject: map['subject'],
      courses: List<String>.from(map['courses']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        subject,
        courses,
      ];
}
