class Routes {
  Routes._();

  /// Splash page route "/"
  static String get splash => "/";

  /// Login page route "/login"
  static String get login => "/login";

  /// SignUp page route "/signup"
  static String get signup => "/signup";

  /// Not found route `/not_found`
  static String get notFound => '/not_found';

  /// Home page route "/home
  static String get home => "/home";

  /// Course page route "/home/course/:id"
  static String course(String id) => "/home/course/$id";
}
