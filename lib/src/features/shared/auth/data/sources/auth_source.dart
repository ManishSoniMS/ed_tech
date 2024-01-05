import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/constants/constraints/collection_name.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failure_codes.dart';
import '../../domain/dtos/login_dto.dart';
import '../../domain/dtos/sign_up_dto.dart';
import '../../domain/entities/user.dart';

abstract class AuthSource {
  Future<UserEntity> isUserLoggedIn();

  Future<UserEntity> login(LoginDTO dto);

  Future<UserEntity> createAccount(SignUpDTO dto);

  Future<void> signOut();
}

@LazySingleton(as: AuthSource)
class AuthSourceImpl extends AuthSource {
  AuthSourceImpl(this._auth, this._db);

  final FirebaseAuth _auth;
  final FirebaseFirestore _db;

  @override
  Future<UserEntity> isUserLoggedIn() async {
    final user = _auth.currentUser;
    if (user != null) {
      final result =
          await _db.collection(CollectionName.users).doc(user.uid).get();
      return UserEntity.fromMap({
        "id": result.id,
        ...result.data()!,
      });
    }
    throw const GeneralException(
      "User is not logged in.",
      FailureCodes.UNKNOWN_ERROR,
    );
  }

  @override
  Future<UserEntity> login(LoginDTO dto) async {
    final userCredentials = await _auth.signInWithEmailAndPassword(
        email: dto.email, password: dto.password);

    final user = userCredentials.user;
    if (user != null) {
      final result =
          await _db.collection(CollectionName.users).doc(user.uid).get();
      return UserEntity.fromMap({
        "id": result.id,
        ...result.data()!,
      });
    }
    throw const GeneralException(
      "Something went wrong.",
      FailureCodes.UNKNOWN_ERROR,
    );
  }

  @override
  Future<UserEntity> createAccount(SignUpDTO dto) async {
    final userCredentials = await _auth.createUserWithEmailAndPassword(
        email: dto.email, password: dto.password);

    final user = userCredentials.user;
    if (user != null) {
      await _db.collection(CollectionName.users).doc(user.uid).set(dto.toMap());
      return UserEntity(
          id: user.uid,
          name: dto.name,
          email: dto.email,
          phone: dto.phone,
          course: const []);
    }
    throw const GeneralException(
      "Something went wrong.",
      FailureCodes.UNKNOWN_ERROR,
    );
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
