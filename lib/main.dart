import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_layout/providers/checkbox_provider.dart';
import 'package:responsive_layout/providers/hover_provider.dart';
import 'package:responsive_layout/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckBoxProvider()),
        ChangeNotifierProvider(create: (context) => TextHoverProvider()),
       
      ],
      child: MaterialApp(
        title: 'Institute App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const HomePage(),
      ),
    );
  }
}
