import 'package:flutter/material.dart';
import 'package:task_flutter/routes/app_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
      initialRoute: AppRoutes.list,
      getPages: AppRoutes.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
    );
  }
}

