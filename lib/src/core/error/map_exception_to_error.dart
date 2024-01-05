import 'dart:io';

import 'exceptions.dart';
import 'failure.dart';
import 'failure_codes.dart';

Failure mapExceptionToFailure(Object? e) {
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

  return Failure(
    message: (e as dynamic)["msg"] ??
        (e as dynamic)["message"] ??
        "Something went wrong",
    code: FailureCodes.UNKNOWN_ERROR,
  );
}
