import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/auth/presentation/view/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // color: Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      // Colors.blueGrey.shade600,
                      // Colors.blueGrey.shade200,
                      // Colors.blueGrey.shade600,
                      // Colors.grey.shade600,
                      // const Color.fromARGB(255, 137, 135, 135),
                      // Colors.grey.shade600,
                      Color(0xFF1C1C1E),
                      Color(0xFF888888),
                      // Color(0xFF1C1C1E),
                    ],
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/auth_images/login.svg',
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 0.4,
                    // width: 130,
                  ),
                ),
              ),

              Positioned(
                top: 42,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade100,
                      color: Colors.white.withOpacity(0.12),

                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white12, width: 0.4),
                    ),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      // color: Colors.black54,
                      color: Colors.white70,
                      size: 28,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 38,
                right: 16,
                child: CustomCircle(
                  opacity: 0.08,
                  color: Colors.white,
                  size: 200,
                ),
              ),
              Positioned(
                bottom: 38,
                left: 16,
                child: CustomCircle(
                  opacity: 0.1,
                  color: AppColors.primaryColor,
                  size: 200,
                ),
              ),
              Positioned(
                bottom: -30,
                right: -16,
                child: CustomCircle(
                  opacity: 0.1,
                  color: Colors.white,
                  size: 130,
                ),
              ),
            ],
          ),
          const SizedBox(height: 42),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/auth_images/Welcome.svg', height: 20),
                Text(
                  'to the store.',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 32,
                    height: 1.3,
                    wordSpacing: 1.8,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Join thousands of happy shoppers.Fast, free, and only takes a few seconds!',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                    height: 1.53,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: const [
                    CustomPadge(
                      icon: Icons.bolt_outlined,
                      label: 'Fast checkout',
                    ),
                    CustomPadge(
                      icon: Icons.lock_outline_rounded,
                      label: 'Secure',
                    ),
                    CustomPadge(
                      icon: Icons.star_border_rounded,
                      label: 'Top brands',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // const SizedBox(height: 8),
          Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   'Let\'s start Your journey with us.',
                //   style: TextStyle(
                //     color: Colors.black45,
                //     fontSize: 12,
                //     wordSpacing: 1.5,
                //   ),
                // ),
                Spacer(),
                Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/auth_images/continue.svg',
                    // color: Colors.black45,
                    height: 28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}

class CustomPadge extends StatelessWidget {
  const CustomPadge({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EDE8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFDDDDDD), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: const Color(0xFF888888)),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 11.5, color: Color(0xFF555555)),
          ),
        ],
      ),
    );
  }
}

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
    required this.opacity,
    required this.color,
    required this.size,
  });
  final double opacity;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(opacity), width: 0.6),
      ),
    );
  }
}

// ============================================
// import 'package:e_commerce_app/core/utils/colors.dart';
// import 'package:e_commerce_app/features/auth/presentation/view/log_in_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F7F4),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ── Hero Section ──────────────────────────────────────────
//           Stack(
//             children: [
//               // Dark hero background
//               Container(
//                 height: size.height * 0.58,
//                 width: size.width,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFF1C1C1E),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(32),
//                     bottomRight: Radius.circular(32),
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     // Subtle circle pattern overlay
//                     Positioned.fill(
//                       child: CustomPaint(painter: _CirclePatternPainter()),
//                     ),
//                     // Main SVG illustration
//                     // Positioned(
//                     //   bottom: 0,
//                     //   left: 0,
//                     //   right: 0,
//                     //   top: 52,
//                     //   child: ShaderMask(
//                     //     blendMode: BlendMode.srcIn,
//                     //     shaderCallback: (Rect bounds) {
//                     //       return LinearGradient(
//                     //         begin: Alignment.topLeft,
//                     //         end: Alignment.bottomRight,
//                     //         colors: [
//                     //           Colors.grey.shade900,
//                     //           Colors.grey.shade500,
//                     //           Colors.grey.shade600,
//                     //         ],
//                     //       ).createShader(bounds);
//                     //     },
//                     //     child: SvgPicture.asset(
//                     //       'assets/auth_images/header1.svg',
//                     //       fit: BoxFit.fill,
//                     //     ),
//                     //   ),
//                     // ),
//                     // Product illustration
//                     Positioned(
//                       top: 52,
//                       left: 16,
//                       right: 16,
//                       child: SvgPicture.asset(
//                         'assets/auth_images/login.svg',
//                         fit: BoxFit.contain,
//                         height: size.height * 0.42,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // ── Back Button (frosted glass) ──
//               Positioned(
//                 top: 52,
//                 left: 16,
//                 child: GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Container(
//                     width: 36,
//                     height: 36,
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.12),
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(
//                         color: Colors.white.withOpacity(0.18),
//                         width: 0.5,
//                       ),
//                     ),
//                     child: const Icon(
//                       Icons.chevron_left_rounded,
//                       color: Colors.white70,
//                       size: 24,
//                     ),
//                   ),
//                 ),
//               ),

//               // ── "Free forever" tag ──
//               Positioned(
//                 top: 56,
//                 right: 16,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 5,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.10),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(
//                       color: Colors.white.withOpacity(0.18),
//                       width: 0.5,
//                     ),
//                   ),
//                   child: const Text(
//                     'Free forever',
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 11,
//                       letterSpacing: 0.3,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // ── Body Content ──────────────────────────────────────────
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Progress dots
//                 Row(
//                   children: [
//                     _Dot(active: true),
//                     const SizedBox(width: 4),
//                     _Dot(active: false),
//                     const SizedBox(width: 4),
//                     _Dot(active: false),
//                   ],
//                 ),

//                 const SizedBox(height: 16),

//                 // Heading
//                 RichText(
//                   text: const TextSpan(
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF1C1C1E),
//                       height: 1.15,
//                       letterSpacing: -0.5,
//                     ),
//                     children: [
//                       TextSpan(text: 'Welcome\n'),
//                       TextSpan(
//                         text: 'to the store.',
//                         style: TextStyle(
//                           color: Color(0xFF888888),
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 10),

//                 // Subtitle
//                 const Text(
//                   'Join thousands of happy shoppers. Fast, free, and only takes a few seconds.',
//                   style: TextStyle(
//                     color: Color(0xFF888888),
//                     fontSize: 13,
//                     height: 1.55,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),

//                 const SizedBox(height: 18),

//                 // Trust pills
//                 Wrap(
//                   spacing: 6,
//                   runSpacing: 6,
//                   children: const [
//                     _Pill(icon: Icons.bolt_outlined, label: 'Fast checkout'),
//                     _Pill(icon: Icons.lock_outline_rounded, label: 'Secure'),
//                     _Pill(icon: Icons.star_border_rounded, label: 'Top brands'),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           const Spacer(),

//           // ── Bottom Row: Sign in hint + Continue button ────────────
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 20, 36),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Sign in hint
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const LoginPage(),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Text(
//                         'Already have an account?',
//                         style: TextStyle(
//                           color: Color(0xFFAAAAAA),
//                           fontSize: 12,
//                         ),
//                       ),
//                       SizedBox(height: 2),
//                       Text(
//                         'Sign in',
//                         style: TextStyle(
//                           color: Color(0xFF555555),
//                           fontSize: 13,
//                           decoration: TextDecoration.underline,
//                           decorationColor: Color(0xFF555555),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Continue button
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const LoginPage(),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 24,
//                       vertical: 14,
//                     ),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1C1C1E),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: const Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Continue',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 0.1,
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Icon(
//                           Icons.arrow_forward_rounded,
//                           color: Colors.white,
//                           size: 16,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Helper Widgets ────────────────────────────────────────────────────────────

// class _Dot extends StatelessWidget {
//   final bool active;
//   const _Dot({required this.active});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       width: active ? 16 : 4,
//       height: 4,
//       decoration: BoxDecoration(
//         color: active ? const Color(0xFF1C1C1E) : const Color(0xFFCCCCCC),
//         borderRadius: BorderRadius.circular(4),
//       ),
//     );
//   }
// }

// class _Pill extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   const _Pill({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF0EDE8),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: const Color(0xFFDDDDDD), width: 0.5),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 13, color: const Color(0xFF888888)),
//           const SizedBox(width: 5),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 11.5, color: Color(0xFF555555)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Subtle circle pattern painter ────────────────────────────────────────────

// class _CirclePatternPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.04)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 0.6;

//     final cx = size.width / 2;
//     final cy = size.height * 0.25;

//     for (final r in [80.0, 140.0, 200.0, 260.0, 320.0]) {
//       canvas.drawCircle(Offset(cx, cy), r, paint);
//     }

//     // Crosshair lines
//     canvas.drawLine(
//       Offset(0, size.height / 2),
//       Offset(size.width, size.height / 2),
//       paint,
//     );
//     canvas.drawLine(
//       Offset(size.width / 2, 0),
//       Offset(size.width / 2, size.height),
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
