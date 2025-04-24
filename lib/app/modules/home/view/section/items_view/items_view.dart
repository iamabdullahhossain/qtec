import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:qtec/app/core/providers/providers.dart';

import '../../../../../shared/controller/screen_controller/screen_controller.dart';


class ItemsView extends ConsumerStatefulWidget {
  const ItemsView({super.key});

  @override
  ConsumerState createState() => _ItemsViewState();
}

class _ItemsViewState extends ConsumerState<ItemsView> {
  final ScrollController scrollControl = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Listen to scroll events
    scrollControl.addListener(() {
      if (scrollControl.position.pixels >= scrollControl.position.maxScrollExtent - 300) {
        // Close to the bottom, load more
        ref.read(productProvider.notifier).loadMoreProducts();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollControl.dispose();
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productProvider);
    return productState.when(
      data:
          (data) => Expanded(
        child: Container(
          margin: EdgeInsets.all(10),
          height: ScreenController.screenHeight,
          width: ScreenController.screenWidth,
          child: GridView.builder(
            controller: scrollControl,
            itemCount: data.products!.length+1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.8 / 3,
            ),
            itemBuilder: (context, index) {
              if(index<data.products!.length){
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
                          '\$${product.price!.toInt()+7}',
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
              }else{
                return const Center(child: CircularProgressIndicator(color: Colors.black));
              }

            },
          ),
        ),
      ),
      error: (e, _) => Text("ERROR"),
      loading: () => Center(child: CircularProgressIndicator(color: Colors.black)),
    );
  }
}
