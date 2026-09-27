import 'dart:ui';

import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_product_image.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/describtion_sectio.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/horizintal_line.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_main_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/rating_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/reviews_section.dart';
import 'package:e_commerce_app/features/order/presentation/view/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 15),
            child: AppBar(
              backgroundColor: Colors.white.withAlpha(120),
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: DetailsAppBar(),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(height: 0.9, color: Colors.grey.shade200),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 110),

              // const SizedBox(height: 24),
              CustomProductImage(product: product),
              const SizedBox(height: 24),
              ProductMainInfo(
                title: product.title!,
                price: product.price!,
                discountPercentage: product.discountPercentage!,
                category: product.category!,
              ),
              const SizedBox(height: 18),
              RatingInfo(
                rating: product.rating!,
                reviews: product.reviews!.length,
                availabilityStatus: product.availabilityStatus!,
              ),
              const SizedBox(height: 24),
              HorizintalLine(
                color: Colors.grey.shade200,
                height: 1,
                horizontalMargin: 48,
                verticalMargin: 0,
                borderRadius: 12,
              ),
              SizedBox(height: 24),
              ProductInfo(
                stock: product.stock!,
                warrantyInfo: product.warrantyInformation!,
                shippingInfo: product.shippingInformation!,
                returnInfo: product.returnPolicy!,
              ),
              const SizedBox(height: 24),
              HorizintalLine(
                color: Colors.grey.shade200,
                height: 1,
                horizontalMargin: 48,
                verticalMargin: 0,
                borderRadius: 12,
              ),
              const SizedBox(height: 24),
              DescribtionSection(
                describtion: product.description!,
                brand: product.brand ?? 'Unknown',
              ),
              const SizedBox(height: 24),
              HorizintalLine(
                color: Colors.grey.shade200,
                height: 1,
                horizontalMargin: 48,
                verticalMargin: 0,
                borderRadius: 12,
              ),
              const SizedBox(height: 24),
              ReviewsSection(
                reviews: product.reviews!,
                rating: product.rating!,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            // height: 70,
            padding: EdgeInsets.only(right: 16, left: 16, top: 6, bottom: 16),
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [
              //     Colors.grey.withOpacity(0.20),
              //     Colors.white.withOpacity(0.15),
              //     Colors.grey.withOpacity(0.20),
              //   ],
              //   stops: const [0.0, 0.5, 1.0],
              // ),

              // color: Colors.white38,
              // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              border: Border(
                top: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          side: BorderSide(color: Colors.black12, width: 1.2),
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context).toggleCart(
                            CartProduct(product: product, quantity: 1),
                          );
                        },
                        child: Text(
                          BlocProvider.of<CartCubit>(
                                context,
                              ).isInCart(product.id!)
                              ? 'Remove from Cart'
                              : 'Add to Cart',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: Colors.grey.shade900,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shadowColor: Colors.transparent,
                    ),

                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) => CheckoutPage(
                            isFromCart: false,
                            totalPrice: product.price!,
                            checkoutProducts: [
                              CartProduct(product: product, quantity: 1),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
