// import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/categories_list.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_search_bar.dart';
import 'package:e_commerce_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:e_commerce_app/features/search/presentation/view/search_page.dart';
import 'package:e_commerce_app/features/search/presentation/view_model/search_products_cubit/search_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const CustomAppBar(),
            const SizedBox(height: 36),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SearchProductsCubit(
                        getIt.get<SearchRepoImplementation>(),
                      ),
                      child: SearchPage(isInHome: true),
                    ),
                  ),
                );
              },
              child: CustomSearchBar(),
            ),
            const SizedBox(height: 36),
            Expanded(child: CategoriesList()),
          ],
        ),
        // ),
      ),
    );
  }
}
