import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/categories_shimmer.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/products_grid.dart';
import 'package:e_commerce_app/features/home/presentation/view_model/get_categories_cubit/get_categories_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view_model/get_products/get_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<String> categories = [];
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetProductsCubit>(
      context,
    ).getProducts(category: selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SvgPicture.asset('assets/icons/Categories.svg'),
        const SizedBox(height: 16),
        //  category list
        BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
          builder: (context, state) {
            if (state is GetCategoriesFailure) {
              return Text(
                state.errorMessage,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              );
            }
            if (state is GetCategoriesSuccess) {
              categories = state.categories;
              return SizedBox(
                height: 33,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return buildCategoryItem(index, context);
                  },
                ),
              );
            }
            return CategoriesShimmer();
          },
        ),

        const SizedBox(height: 9),

        // product grid
        Expanded(child: ProductGrid()),
      ],
    );
  }

  GestureDetector buildCategoryItem(int index, BuildContext context) {
    return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[index];
                        BlocProvider.of<GetProductsCubit>(
                          context,
                        ).getProducts(category: selectedCategory);
                      });
                    },
                    child: Container(
                      // width: 80,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 6,
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: selectedCategory == categories[index]
                            ? AppColors.primaryColor
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(color: Colors.black12, width: 0.3),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 12,
                            // color: AppColors.text2Color,
                            color: selectedCategory == categories[index]
                                ? Colors.white
                                : Colors.black38,
                            fontWeight: selectedCategory == categories[index]
                                ? FontWeight.w700
                                : FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
  }

}
