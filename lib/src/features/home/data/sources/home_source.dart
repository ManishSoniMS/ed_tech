import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/constraints/collection_name.dart';
import '../../domain/entities/course.dart';
import '../../domain/entities/teachers.dart';

abstract class HomeSource {
  Future<List<Course>> fetchAllCourses();

  Future<Tuple2<Course, List<Teachers>>> fetchCourseDetails(String id);
}

@LazySingleton(as: HomeSource)
class HomeSourceImpl extends HomeSource {
  HomeSourceImpl(this._db);

  final FirebaseFirestore _db;

  @override
  Future<List<Course>> fetchAllCourses() async {
    final result = await _db.collection(CollectionName.courses).get();
    return result.docs
        .map((e) => Course.fromMap({
              "id": e.id,
              ...e.data(),
            }))
        .toList();
  }

  @override
  Future<Tuple2<Course, List<Teachers>>> fetchCourseDetails(String id) async {
    final courseRef =
        await _db.collection(CollectionName.courses).doc(id).get();

    final course = Course.fromMap({
      "id": courseRef.id,
      ...courseRef.data()!,
    });

    final teachersRef = await _db
        .collection(CollectionName.teachers)
        .where("courses", arrayContains: id)
        .get();

    final teachers = teachersRef.docs
        .map((e) => Teachers.fromMap({
              "id": e.id,
              ...e.data(),
            }))
        .toList();

    return Tuple2(course, teachers);
  }
}
