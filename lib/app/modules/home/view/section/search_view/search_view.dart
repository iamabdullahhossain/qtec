import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';


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
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/icon/search.png", height: 20, width: 20,),
            Gap(10),
            Text("Search Anything...", style:  TextStyle(color: const Color(0xFF9CA3AF),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ))
          ],
        ),
      ),
    );
  }
}


/* TextField(
        cursorColor: Colors.black,
        readOnly: true,
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
      )*/
