import 'dart:ui';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LiquidGlassNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const LiquidGlassNavBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: _GlassNavBar(
            currentIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
          ),
        ),
      ),
    );
  }
}

class _GlassNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const _GlassNavBar({
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  static const _items = [
    _NavItem(
      icon: 'assets/icons/Home.svg',
      selectedIcon: 'assets/icons/home_selected.svg',
      label: 'Home',
    ),
    _NavItem(
      icon: 'assets/icons/search.svg',
      selectedIcon: 'assets/icons/search.svg',
      label: 'Search',
    ),
    _NavItem(
      icon: 'assets/icons/heart.svg',
      selectedIcon: null, // uses Material icon
      label: 'Favourites',
    ),
    _NavItem(
      icon: 'assets/icons/Profile.svg',
      selectedIcon: 'assets/icons/Profile_selected.svg',
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 6),
        child: Container(
          padding: EdgeInsets.all(3),
          // height: 62,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            // Liquid glass layers: white tint + gradient shimmer
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey.shade200.withOpacity(0.38),
                Colors.grey.shade200.withOpacity(0.20),
                Colors.grey.shade200.withOpacity(0.18),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade400.withAlpha(30),
                width: 1.4,
              ),
              bottom: BorderSide(
                color: Colors.grey.shade400.withAlpha(30),
                width: 1.2,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.09),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
              // BoxShadow(
              //   color: Colors.white.withOpacity(0.5),
              //   blurRadius: 1,
              //   offset: const Offset(0, -1),
              // ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _items.length,
              (index) => _GlassNavItem(
                item: _items[index],
                isSelected: currentIndex == index,
                onTap: () => onDestinationSelected(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassNavItem extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _GlassNavItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 14),
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                shape: BoxShape.rectangle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryColor.withOpacity(0.50),
                    AppColors.primaryColor.withOpacity(0.1),
                  ],
                ),
                // border: Border.all(
                //   color: AppColors.primaryColor.withOpacity(0.35),
                //   width: 1,
                // ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              )
            : null,
        child: _buildIcon(),
      ),
    );
  }

  Widget _buildIcon() {
    // Special case: Favourites uses a Material icon when selected
    if (item.selectedIcon == null) {
      return isSelected
          ? Icon(Icons.favorite, color: AppColors.primaryColor, size: 24)
          : SvgPicture.asset(
              item.icon,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.black45,
                BlendMode.srcIn,
              ),
            );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isSelected
          ? SvgPicture.asset(
              item.selectedIcon!,
              key: ValueKey('selected_${item.label}'),
              height: 24,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            )
          : SvgPicture.asset(
              item.icon,
              key: ValueKey('unselected_${item.label}'),
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.black45,
                BlendMode.srcIn,
              ),
            ),
    );
  }
}

class _NavItem {
  final String icon;
  final String? selectedIcon;
  final String label;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}
