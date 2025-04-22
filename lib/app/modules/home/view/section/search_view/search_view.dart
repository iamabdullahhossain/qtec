import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 48,
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset("assets/icon/search.png", height: 20, width: 20,),
          ),
          hintText: "Search Anything...",
          hintStyle: TextStyle(color: const Color(0xFF9CA3AF),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}*/

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 48,
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset("assets/icon/search.png", height: 20, width: 20,),
          ),
          hintText: "Search Anything...",
          hintStyle: TextStyle(color: const Color(0xFF9CA3AF),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
