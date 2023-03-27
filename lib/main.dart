import 'package:flutter/material.dart';
import 'package:hereis/repositoreis/cep_repository.dart';
import 'package:provider/provider.dart';

import 'core/routes/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CepRepository(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Here Is',
      initialRoute: Routes.splashPage,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff38c172),
      ),
      routes: Routes.routes,
    );
  }
}
