import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final List<String> course;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.course,
  });

  @override
  String toString() {
    return 'UserEntity{ id: $id, name: $name, email: $email, phone: $phone, course: $course,}';
  }

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    List<String>? course,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      course: course ?? this.course,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'course': course,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      course: List<String>.from(map['course'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        course,
      ];
}
