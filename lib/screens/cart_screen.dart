import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../widgets/main_bottom_nav.dart';
import 'home_screen.dart';
import 'ai_consult_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartItems = [
      const _CartItemData(
        title: 'Ghế Sofa Băng Vải Nỉ',
        subtitle: 'Màu: Xám Tro, 24.500.000₫',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuA8giUAlXTw8fAn9w-ZOJVo5jAhBAgyh-EEbU8X64VUFc04FfuWyR7Ks8VeiU2dJ60ZaqUcEExroPqb0-nXzbJ_AT9B3awnoN28FxyBx-AtJfeT_ymD22EWBZswg5IkRW4HA1Y5s5Wq1WPNN4ZdYUEHrbG1EI74i354DeMr_bqZCKCZOFwemyPNVyJgbiwPFhkmj82nDeCKHbLsznleSpQvjh3KeHQnxGi3yxpko4IjiLmobq_lv9_ojwHO2b8d5dDV5y1o7nuIFl0O',
      ),
      const _CartItemData(
        title: 'Bàn Cà Phê Gỗ Sồi',
        subtitle: 'Màu: Gỗ tự nhiên, 8.750.000₫',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAVNxDMU_D34mHR3vtNKy1fwF_SSGxLkrKuzKtOzTIE1nOduLXHIjKTPsvVKcnbAFtV2mSUD8yHyNfh2Ior-GwuroFwVa-_65yMDQa8a27iF5i1JFqNObqbErSZvloCG0yOj4DgnRt_vVH6jC5coGAm46bdVmttlqywI-OFXGX5dSLgIiS3wIeAAEEdXWE33ufaE0tanfRzijTJ6ciOXgBH7Nn6S93VbO8lYpdunvr5lyuOSz6uh19BsR3rcob7ue0r6f4SjjE6KRHI',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 120),
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back),
                    Expanded(
                      child: Text(
                        'Giỏ hàng của bạn',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.more_horiz),
                  ],
                ),
              ),
              const Divider(),
              ...cartItems.map(
                (item) => Column(
                  children: [
                    _CartItemTile(data: item),
                    const Divider(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: const [
                    _SummaryRow(
                      label: 'Tạm tính',
                      value: '33.250.000₫',
                    ),
                    SizedBox(height: 8),
                    _SummaryRow(
                      label: 'Phí vận chuyển',
                      value: 'Sẽ được tính ở bước sau',
                      isEmphasis: false,
                    ),
                    SizedBox(height: 12),
                    Divider(),
                    SizedBox(height: 12),
                    _SummaryRow(
                      label: 'Tổng cộng',
                      value: '33.250.000₫',
                      isEmphasis: true,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.backgroundDark,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Tiến hành thanh toán',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNav(
        active: MainNavItem.cart,
        onTap: (item) => _onNavTap(context, item),
      ),
    );
  }

  void _onNavTap(BuildContext context, MainNavItem item) {
    if (item == MainNavItem.cart) return;
    switch (item) {
      case MainNavItem.home:
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        break;
      case MainNavItem.consult:
        Navigator.of(context).pushNamed(AiConsultScreen.routeName);
        break;
      default:
        break;
    }
  }
}

class _CartItemData {
  const _CartItemData({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
}

class _CartItemTile extends StatelessWidget {
  const _CartItemTile({required this.data});

  final _CartItemData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              data.imageUrl,
              height: 64,
              width: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.subtitle,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _quantityButton(icon: Icons.remove),
              const SizedBox(width: 6),
              const Text(
                '1',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 6),
              _quantityButton(icon: Icons.add),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantityButton({required IconData icon}) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.grey.shade200,
      child: Icon(icon, size: 16, color: Colors.black87),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isEmphasis = false,
  });

  final String label;
  final String value;
  final bool isEmphasis;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: isEmphasis ? 18 : 16,
      fontWeight: isEmphasis ? FontWeight.bold : FontWeight.w500,
    );
    return Row(
      children: [
        Expanded(child: Text(label, style: textStyle)),
        Text(
          value,
          style: textStyle.copyWith(
            color: isEmphasis ? Colors.black : Colors.grey.shade700,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
