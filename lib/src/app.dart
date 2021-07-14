import 'package:empty_flutter/src/controllers/bind/default.dart';
import 'package:empty_flutter/src/screens/main/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: DefaultBind(),
      title: "Sinema",
      home: Scaffold(
          body: HomePage()
      ),
      theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Colors.white,
          accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
    );
  }
}