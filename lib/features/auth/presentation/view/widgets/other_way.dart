// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class OtherWay extends StatelessWidget {
//   const OtherWay({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(child: Divider(thickness: 1, color: Colors.black54)),
//               Text(
//                 '  Or continue with  ',
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 13,
//                 ),
//               ),
//               Expanded(child: Divider(thickness: 1, color: Colors.black54)),
//             ],
//           ),
//           SizedBox(height: 16),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,

//             children: [
//               SvgPicture.asset('assets/auth_images/facebook.svg'),
//               SizedBox(width: 16),
//               SvgPicture.asset('assets/auth_images/google.svg'),
//               SizedBox(width: 16),
//               SvgPicture.asset('assets/auth_images/apple.svg'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// ==========================================
import 'package:e_commerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class OtherWay extends StatelessWidget {
  const OtherWay({super.key});

  // static const _kGray100 = Color(0xFFF3F4F6);
  static const _kGray300 = Color(0xFFD1D5DB);
  static const _kGray400 = Color(0xFF9CA3AF);
  static const _kGray900 = Color(0xFF111827);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          //  Divider
          Row(
            children: [
              const Expanded(child: Divider(thickness: 0.8, color: _kGray300)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'or continue with',
                  style: const TextStyle(
                    fontSize: 12,
                    color: _kGray400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Expanded(child: Divider(thickness: 0.8, color: _kGray300)),
            ],
          ),

          const SizedBox(height: 16),

          //  Social buttons
          Row(
            children: [
              Expanded(
                child: _SocialBtn(
                  label: 'Google',
                  icon: SvgPicture.asset(
                    'assets/auth_images/google.svg',
                    height: 24,
                  ),
                  onTap: () {
                    BlocProvider.of<AuthCubit>(context).signInWithGoogle();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SocialBtn(
                  label: 'Apple',
                  icon: const Icon(
                    Icons.apple_rounded,
                    size: 24,
                    color: _kGray900,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialBtn extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;

  const _SocialBtn({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  static const _kGray100 = Color(0xFFF3F4F6);
  static const _kGray300 = Color(0xFFD1D5DB);
  static const _kGray900 = Color(0xFF111827);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: _kGray100,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _kGray300, width: 0.8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _kGray900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
