import 'package:flutter/material.dart';
import 'package:newspaper/src/pages/tabs_page.dart';
import 'package:newspaper/src/theme/tema.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: miTema.copyWith(
        colorScheme: miTema.colorScheme.copyWith(
          secondary: Colors.red,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TabsScreen(),
    );
  }
}
