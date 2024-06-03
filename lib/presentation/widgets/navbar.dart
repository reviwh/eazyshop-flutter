import 'package:eazyshop/core/theme/app_color.dart';
import 'package:eazyshop/core/theme/app_style.dart';
import 'package:eazyshop/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onIndexChange;

  const NavbarWidget({
    super.key,
    this.currentIndex = 0,
    required this.onIndexChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 108,
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navbarItemWidget(
            icon: 'assets/icons/home.svg',
            label: 'Home',
            active: currentIndex == 0,
            onTap: () => onIndexChange(0),
          ),
          _navbarItemWidget(
            icon: 'assets/icons/local_shipping.svg',
            label: 'My Order',
            active: currentIndex == 1,
            onTap: () => onIndexChange(1),
          ),
          _navbarItemWidget(
            icon: 'assets/icons/favorite.svg',
            label: 'Favorite',
            active: currentIndex == 2,
            onTap: () => onIndexChange(2),
          ),
          _navbarItemWidget(
            icon: 'assets/icons/account_circle.svg',
            label: 'Profile',
            active: currentIndex == 3,
            onTap: () => onIndexChange(3),
          ),
        ],
      ),
    );
  }

  _navbarItemWidget({
    required String icon,
    required String label,
    bool active = false,
    required VoidCallback onTap,
  }) {
    Color color = active ? AppColors.tertiary : AppColors.grey;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SvgIcon(assetName: icon, size: 36, color: color),
            Text(label, style: AppStyles.infoBody.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}
