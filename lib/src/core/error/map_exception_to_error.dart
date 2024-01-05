import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'exceptions.dart';
import 'failure.dart';
import 'failure_codes.dart';

Failure mapExceptionToFailure(Object? e) {
  log("\n\n map exception :: $e \n\n");
  if (e is SocketException) {
    return Failure(
      message: e.message,
      code: FailureCodes.NO_INTERNET,
    );
  }

  if (e is AssertionError) {
    return Failure(
      message: e.message.toString(),
      code: FailureCodes.ASSERTION_ERROR,
    );
  }

  if (e is GeneralException) {
    return Failure(
      message: e.message.toString(),
      code: FailureCodes.ASSERTION_ERROR,
    );
  }

  if (e is FirebaseException) {
    return Failure(
      message: e.message ?? e.code,
      code: e.code,
    );
  }

  return Failure(
    message: (e as dynamic)["msg"] ??
        (e as dynamic)["message"] ??
        "Something went wrong",
    code: FailureCodes.UNKNOWN_ERROR,
  );
}
