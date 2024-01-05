class LoginDTO {
  final String email;
  final String password;

  const LoginDTO({
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'LoginDTO{ email: $email, password: $password,}';
  }
}
