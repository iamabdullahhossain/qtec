import 'package:flutter/material.dart';
import 'package:qtec/app/modules/home/view/section/items_view/items_view.dart';
import 'package:qtec/app/modules/home/view/section/search_view/search_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            SearchView(),
            ItemsView()
          ],
        ),
      ),
    );
  }
}
