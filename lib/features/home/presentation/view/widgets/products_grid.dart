import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_no_network.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_grid_shimmer.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_item.dart';
import 'package:e_commerce_app/features/home/presentation/view_model/get_products/get_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsFailure) {
          return CustomNoNetwork(errorMessage: state.errorMessage);
        }
        if (state is GetProductsSuccess) {
          List products = state.products;

          return Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 22),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // physics: BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: 0.4, // 1.8
                        childAspectRatio: 0.65, // 1.8
                        crossAxisSpacing: 10, // x axis spacing
                        mainAxisSpacing: 10, // y axis spacing
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductItem(product: products[index]);
                      },
                    ),
                    SizedBox(height: 75),
                  ],
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                    colors: [
                      Colors.white.withAlpha(250),
                      Colors.white.withAlpha(200),
                      Colors.white.withAlpha(150),
                      // Colors.white.withAlpha(120),
                      Colors.white.withAlpha(100),
                      Colors.white.withAlpha(70),
                      Colors.white.withAlpha(50),
                      Colors.white.withAlpha(25),
                      Colors.white.withAlpha(0),

                      
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return ProductGridShimmer();
      },
    );
  }
}
