import 'package:flutter/material.dart';
import 'package:screens/router/app_routes.dart';
import 'package:screens/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: AppRouters.initialRoute,
      routes: AppRouters.routers,
    );
  }
}
