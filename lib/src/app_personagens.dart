import 'package:flutter/material.dart';

import 'pages/forms/forms_page.dart';
import 'pages/home/home_page.dart';

class AppPersonagens extends StatelessWidget {
  const AppPersonagens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personagens',
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/forms": (context) => const FormsPage(),
      },
    );
  }
}
