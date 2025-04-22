import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:qtec/app/core/providers/providers.dart';
import 'package:qtec/app/shared/controller/screen_controller/screen_controller.dart';
/*
class ItemsView extends StatefulWidget {
  const ItemsView({super.key});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        height: ScreenController.screenHeight,
        width: ScreenController.screenWidth,
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.8 / 3,
          ),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/image/product.png", height: 164),
                Gap(10),
                Text(
                  "Allen Solly Regular fit cotton shirt",
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    Text(
                      '\$35',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.50,
                        letterSpacing: 0.07,
                      ),
                    ),

                    Text(
                      '\$40.25',
                      style: TextStyle(
                        color: const Color(0xFF9CA3AF),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                        height: 2.3,
                      ),
                    ),
                    Text(
                      '15% OFF',
                      style: TextStyle(
                        color: const Color(0xFFEA580C),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 2.3,
                      ),
                    ),
                  ],
                ),
                Gap(8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Image.asset(
                        "assets/icon/rating.png",
                        height: 12,
                        width: 12,
                      ),
                    ),
                    Text(
                      '4.3',
                      style: TextStyle(
                        color: const Color(0xFF1F2937),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                    Text(
                      '(41)',
                      style: TextStyle(
                        color: const Color(0xFF6B7280),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),

                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}*/

class ItemsView extends ConsumerWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);

    return productState.when(
      data:
          (data) => Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              height: ScreenController.screenHeight,
              width: ScreenController.screenWidth,
              child: GridView.builder(
                itemCount: data.products!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.8 / 3,
                ),
                itemBuilder: (context, index) {
                  final product = data.products![index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(product.thumbnail.toString(), height: 164),
                      Gap(10),
                      Text(
                        product.title.toString(),
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Text(
                            '\$${product.price.toString()}',
                            style: TextStyle(
                              color: const Color(0xFF1F2937),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.50,
                              letterSpacing: 0.07,
                            ),
                          ),

                          Text(
                            '\$40.25',
                            style: TextStyle(
                              color: const Color(0xFF9CA3AF),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              height: 2.3,
                            ),
                          ),
                          Text(
                            '${product.discountPercentage.toString()}% OFF',
                            style: TextStyle(
                              color: const Color(0xFFEA580C),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              height: 2.3,
                            ),
                          ),
                        ],
                      ),
                      Gap(8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Image.asset(
                              "assets/icon/rating.png",
                              height: 12,
                              width: 12,
                            ),
                          ),
                          Text(
                            product.rating.toString(),
                            style: TextStyle(
                              color: const Color(0xFF1F2937),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                          Text(
                            '(${product.reviews!.length})',
                            style: TextStyle(
                              color: const Color(0xFF6B7280),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      error: (e, _) => Text("ERROR"),
      loading: () => Center(child: CircularProgressIndicator(color: Colors.black)),
    );
  }
}
