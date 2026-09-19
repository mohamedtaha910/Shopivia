import 'package:e_commerce_app/core/models/product_model/dimensions.dart';
import 'package:e_commerce_app/core/models/product_model/meta.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/core/models/product_model/review.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo_implementation.dart';
import 'package:e_commerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/favourite/data/repos/favourite_repo_implementation.dart';
import 'package:e_commerce_app/features/favourite/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:e_commerce_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:e_commerce_app/features/home/presentation/view_model/get_categories_cubit/get_categories_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view_model/get_products/get_products_cubit.dart';
import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/data/repos/order_repo_implementation.dart';
import 'package:e_commerce_app/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:e_commerce_app/features/splash/presentation/view/splash_page.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(DimensionsAdapter());
  Hive.registerAdapter(MetaAdapter());
  Hive.registerAdapter(ReviewAdapter());
  Hive.registerAdapter(CartProductAdapter());
  Hive.registerAdapter(OrderAdapter());

  setUpServiceLocator();
  await GoogleSignIn.instance.initialize(
    serverClientId: '727044072264-64m0c3tnih5lg41mpohe353js9916sdb.apps.googleusercontent.com',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetCategoriesCubit(getIt.get<HomeRepoImplementation>())
                ..getCategories(),
        ),
        BlocProvider(
          create: (context) =>
              GetProductsCubit(getIt.get<HomeRepoImplementation>()),
        ),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create: (context) => FavouriteCubit(
            FavouriteRepoImplementation(auth: FirebaseAuth.instance),
          ),
        ),
        BlocProvider(
          create: (context) =>
              CartCubit(CartRepoImplementation(auth: FirebaseAuth.instance)),
        ),
        BlocProvider(
          create: (context) =>
              OrderCubit(OrderRepoImplementation(auth: FirebaseAuth.instance)),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // scaffoldBackgroundColor: AppColors.backgroundColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
