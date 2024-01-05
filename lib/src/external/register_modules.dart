import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

/// To Register third party types like SharedPreference, Dio, etc.
///
/// learn more about it here
/// [https://pub.dev/packages/injectable#providing-custom-initializers]
@module
abstract class RegisterModule {
  /// FirebaseAuth instance
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  /// Firebase firestore instance
  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
