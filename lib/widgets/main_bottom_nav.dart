import 'package:flutter/material.dart';

import '../config/app_colors.dart';

enum MainNavItem { home, favorite, cart, consult, account }

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    super.key,
    required this.active,
    this.onTap,
  });

  final MainNavItem active;
  final void Function(MainNavItem item)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        border: const Border(
          top: BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBtn(
              icon: Icons.home_outlined,
              label: 'Trang chủ',
              isActive: active == MainNavItem.home,
              onTap: () => onTap?.call(MainNavItem.home),
            ),
            _NavBtn(
              icon: Icons.favorite_border,
              label: 'Yêu thích',
              isActive: active == MainNavItem.favorite,
              onTap: () => onTap?.call(MainNavItem.favorite),
            ),
            _NavBtn(
              icon: Icons.shopping_bag_outlined,
              label: 'Giỏ hàng',
              isActive: active == MainNavItem.cart,
              onTap: () => onTap?.call(MainNavItem.cart),
            ),
            _NavBtn(
              icon: Icons.chat_bubble_outline,
              label: 'Tư vấn',
              isActive: active == MainNavItem.consult,
              onTap: () => onTap?.call(MainNavItem.consult),
            ),
            _NavBtn(
              icon: Icons.person_outline,
              label: 'Tài khoản',
              isActive: active == MainNavItem.account,
              onTap: () => onTap?.call(MainNavItem.account),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBtn extends StatelessWidget {
  const _NavBtn({
    required this.icon,
    required this.label,
    this.isActive = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.olivePrimary : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: isActive ? AppColors.olivePrimary : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

