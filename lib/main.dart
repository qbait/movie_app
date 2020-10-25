import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      theme: ThemeData(primarySwatch: Colors.red, brightness: Brightness.light),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(accentColor: Colors.redAccent, brightness: Brightness.dark),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
