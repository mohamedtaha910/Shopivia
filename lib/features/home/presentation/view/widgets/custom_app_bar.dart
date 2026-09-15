import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/cart/presentation/views/cart_page.dart';
import 'package:e_commerce_app/features/notification/presentation/view/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            // color: Colors.grey.shade50,
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(25),
            // border: Border.all(color: Colors.grey.shade400 , width: 0.6),
          ),
          child: Image.asset('assets/icons/logo_icon.png', height: 32),
          // SvgPicture.asset(
          //   'assets/icons/logo.svg',
          //   color: AppColors.primaryColor,
          //   height: 20,
          // ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Dear',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            SvgPicture.asset('assets/icons/Good Morning.svg', height: 16),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (c) => NotificationPage()));
          },
          child: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              // color: Colors.grey.shade50,
              color: Colors.grey.shade100,
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(14),
            ),
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
              height: 22,
              // color: Colors.grey.shade700,
            ),
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (c) => CartPage()));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(13),
              // shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/icons/bag.svg', height: 24),
          ),
        ),
      ],
    );
  }
}
