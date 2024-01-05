import 'package:flutter/material.dart';

import '../../../../../../routes/routes.dart';

class NotFoundPage extends StatelessWidget {

  const NotFoundPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: Routes.notFound),
      builder: (context) => const NotFoundPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Found"),
      ),
      body: const Center(
        child: Text("Page Not Found/"),
      ),
    );
  }
}
