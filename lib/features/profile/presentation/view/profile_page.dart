// import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/cart/presentation/views/cart_page.dart';
import 'package:e_commerce_app/features/favourite/presentation/view/favourite_page.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/horizintal_line.dart';
import 'package:e_commerce_app/features/order/presentation/view/orders_page.dart';
import 'package:e_commerce_app/features/profile/presentation/view/change_password_page.dart';
import 'package:e_commerce_app/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:e_commerce_app/features/profile/presentation/view/widgets/profile_row.dart';
import 'package:e_commerce_app/features/splash/presentation/view/splash_page.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400, width: 0.4),
              ),
              child: Icon(
                CupertinoIcons.settings_solid,
                // color: Colors.black54,
                size: 22,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0, top: 8),
                child: ProfileHeader(),
              ),
              Text(
                'Personal',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                // margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16),
                  // border: Border.all(color: Colors.grey.shade400, width: 0.1),
                  border: Border.all(
                    color: Colors.grey.shade400.withAlpha(90),
                    width: 0.6,
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black12,
                  //     offset: Offset(0, 2),
                  //     blurRadius: 2,
                  //   ),
                  // ],
                ),
                child: Column(
                  children: [
                    ProfileRow(
                      text: 'Orders',
                      textColor: Colors.black87,
                      icon: CupertinoIcons.creditcard_fill,
                      // iconColor: Colors.blueAccent,
                      // iconColor: Colors.deepPurpleAccent.shade700,
                      iconColor: Colors.blueAccent,
                      circleColor: Colors.black.withAlpha(15),
                      arrowColor: Colors.grey.shade700,
                      onTap: () {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (c) => OrdersPage()));
                      },
                    ),
                    HorizintalLine(
                      color: Colors.grey.shade400.withAlpha(200),
                      height: 1.0,
                      horizontalMargin: 36,
                      verticalMargin: 16,
                      borderRadius: 12,
                    ),
                    ProfileRow(
                      text: 'Cart',
                      textColor: Colors.black87,
                      icon: CupertinoIcons.bag_fill,
                      iconColor: Colors.orangeAccent,
                      circleColor: Colors.black.withAlpha(15),
                      arrowColor: Colors.grey.shade700,
                      onTap: () {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (c) => CartPage()));
                      },
                    ),
                    HorizintalLine(
                      color: Colors.grey.shade400.withAlpha(200),
                      height: 1.0,
                      horizontalMargin: 36,
                      verticalMargin: 16,
                      borderRadius: 12,
                    ),

                    ProfileRow(
                      text: 'Favorites',
                      textColor: Colors.black87,
                      // icon: CupertinoIcons.bookmark_fill,
                      icon: Icons.bookmark_rounded,
                      iconColor: Colors.pinkAccent.shade200,
                      circleColor: Colors.black.withAlpha(15),
                      arrowColor: Colors.black54,
                      onTap: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => FavouritePage(isFromProfile: true),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'General',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16),
                  // border: Border.all(color: Colors.grey.shade400, width: 0.1),
                  border: Border.all(
                    color: Colors.grey.shade400.withAlpha(90),
                    width: 0.6,
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black12,
                  //     offset: Offset(0, 2),
                  //     blurRadius: 2,
                  //   ),
                  // ],
                ),
                child: Column(
                  children: [
                    ProfileRow(
                      text: 'Settings',
                      textColor: Colors.black87,
                      icon: Icons.settings,
                      iconColor: const Color.fromARGB(255, 80, 88, 130),
                      circleColor: Colors.black.withAlpha(15),
                      arrowColor: Colors.grey.shade700,
                    ),
                    HorizintalLine(
                      color: Colors.grey.shade400.withAlpha(200),
                      height: 1.0,
                      horizontalMargin: 36,
                      verticalMargin: 16,
                      borderRadius: 12,
                    ),
                    ProfileRow(
                      text: 'Change Password',
                      textColor: Colors.black87,
                      icon: CupertinoIcons.lock_fill,
                      iconColor: Colors.blueGrey,
                      circleColor: Colors.black.withAlpha(15),
                      arrowColor: Colors.grey.shade700,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => ChangePasswordPage(),
                          ),
                        );
                      },
                    ),
                    HorizintalLine(
                      color: Colors.grey.shade400.withAlpha(200),
                      height: 1.0,
                      horizontalMargin: 36,
                      verticalMargin: 16,
                      borderRadius: 12,
                    ),

                    ProfileRow(
                      text: 'Logout',
                      textColor: Colors.redAccent,
                      icon: Icons.logout,
                      iconColor: Colors.red,
                      circleColor: Colors.redAccent.withAlpha(50),
                      arrowColor: Colors.redAccent,
                      onTap: () async {
                        confirmLogout(context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 110),
            ],
          ),
        ),
      ),
    );
  }

  void confirmLogout(BuildContext context) {
    (showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.withAlpha(50),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.logout, color: Colors.red, size: 26),
            ),
            SizedBox(height: 16),
            Text(
              'Are you sure you want to logout?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: 'Cancel',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  verticalPadding: 3,
                  // color: AppColors.primaryColor.withAlpha(50),
                  color: Colors.transparent,
                  textColor: AppColors.primaryColor,
                  horizontalMargin: 8,
                  titleSize: 14,
                  isBorder: true,
                ),
                CustomButton(
                  title: 'Logout',
                  onTap: () {
                    GoogleSignIn.instance.signOut();
                    // await FirebaseAuth.instance.signOut();
                    FirebaseAuth.instance.signOut();
                    if (!context.mounted) return;
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (c) => SplashPage()),
                      (route) => false,
                    );
                  },
                  verticalPadding: 4,
                  color: Colors.red.withAlpha(50),
                  textColor: Colors.red,
                  horizontalMargin: 8,
                  titleSize: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
