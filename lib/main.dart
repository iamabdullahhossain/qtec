import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qtec/app/modules/home/view/home_screen.dart';
import 'package:qtec/app/shared/controller/screen_controller/screen_controller.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      builder: (context, child){
        ScreenController.sizeInitialization(context);
        return child!;
      },
    );
  }
}


