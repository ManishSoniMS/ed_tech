/// {@template base_validator}
/// A validator that checks if the value is a valid or not.
/// {@endtemplate}
abstract class Validator<T> {
  /// {@macro base_validator}
  const Validator({required this.message});

  /// A message to show when the value is invalid.
  final String message;

  /// Validates the value.
  /// Returns `true` if the value is valid, `false` otherwise.
  bool isValid(T? value);
}

/// {@template required_validator}
/// Checks if the value is not null or empty.
/// {@endtemplate}
class RequiredValidator extends Validator<String?> {
  /// {@macro required_validator}
  RequiredValidator({String? message})
      : super(
          message: message ?? "This field is required",
        );

  @override
  bool isValid(String? value) => value != null && value.isNotEmpty;
}

/// {@template phone_number__validator}
/// Checks if the value is valid phone number.
/// {@endtemplate}
class PhoneNumberValidator extends Validator<String?> {
  /// {@macro phone_number_validator}
  PhoneNumberValidator({String? message})
      : super(
          message: message ?? "Please enter valid phone number.",
        );

  @override
  bool isValid(String? value) => value != null && value.length == 10;
}

/// {@template email_validator}
/// Checks if the value is a valid email address.
/// {@endtemplate}
class EmailValidator extends Validator<String?> {
  /// {@macro email_validator}
  EmailValidator({String? message})
      : super(
          message: message ?? "Please enter valid email address.",
        );

  @override
  bool isValid(String? value) {
    // Regex to check for valid email address.
    final regex = RegExp(r'\S+@\S+\.\S+');

    return value != null && regex.hasMatch(value);
  }
}

/// {@template confirm_password_validator}
/// Checks if the value is a valid email address.
/// {@endtemplate}
class ConfirmPasswordValidator extends Validator<String?> {
  /// {@macro confirm_password_validator}
  ConfirmPasswordValidator(this.password, {String? message})
      : super(
          message: message ?? "Password doesn't match.",
        );

  final String password;

  @override
  bool isValid(String? value) => value != null && value == password;
}

/// {@template min_length_validator}
/// This validator check if the value has a minimum length of [minLength].
/// {@endtemplate}
class MinimumLengthValidator extends Validator<String?> {
  /// {@macro min_length_validator}
  MinimumLengthValidator({
    required this.minLength,
    String? message,
  }) : super(
          message: message ?? "Please enter at least $minLength characters.",
        );

  /// The minimum length of the value.
  final int minLength;

  @override
  bool isValid(String? value) => value != null && value.length >= minLength;
}

/// {@template max_length_validator}
/// This validator check if the value has a maximum length of [maxLength].
/// {@endtemplate}
class MaximumLengthValidator extends Validator<String?> {
  /// {@macro max_length_validator}
  MaximumLengthValidator({
    required this.maxLength,
    String? message,
  }) : super(
          message: message ?? "Please enter at most $maxLength characters.",
        );

  /// The maximum length of the value.
  final int maxLength;

  @override
  bool isValid(String? value) => value != null && value.length <= maxLength;
}

/// {@template form_validator}
/// A form field validator that checks for multiple validation on the value.
/// {@endtemplate}
class FormValidator {
  /// {@macro form_validator}
  const FormValidator(this.validators);

  /// A list of [Validator]s.
  final List<Validator<dynamic>> validators;

  /// Validates the value by iterating through the [validators].
  String? call(String? value) {
    for (var validator in validators) {
      if (!validator.isValid(value)) {
        return validator.message;
      }
    }
    return null;
  }
}
