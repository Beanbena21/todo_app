import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/provider_models.dart';
void main() {
  runApp(
    ChangeNotifierProvider<ProviderModels>(
      create: (context) => ProviderModels(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}