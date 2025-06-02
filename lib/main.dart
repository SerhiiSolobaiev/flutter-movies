import 'package:flutter/material.dart';

import 'di/di.dart' as di;
import 'ui/movies_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoviesListScreen(),
    );
  }
}
