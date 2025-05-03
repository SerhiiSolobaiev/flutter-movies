import 'package:flutter/material.dart';
import 'package:flutter_onboarding/repository/storage/AppDatabaseBuilder.dart';
import 'package:flutter_onboarding/ui/movies_list.dart';

import 'di/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.setupDI();
  await di.getIt<AppDatabaseBuilder>().build();

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
      home: const MyHomePage(),
    );
  }
}
