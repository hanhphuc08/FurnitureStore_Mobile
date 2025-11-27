import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product-detail';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  int selectedColor = 0;

  final colors = [
    const Color(0xFFF5F5DC),
    Colors.grey,
    AppColors.olivePrimary,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(bottom: 200),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _roundIcon(Icons.arrow_back, () => Navigator.pop(context)),
                      Row(
                        children: [
                          _roundIcon(Icons.favorite_border, () {}),
                          const SizedBox(width: 8),
                          _roundIcon(Icons.share, () {}),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: 4 / 5,
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuA_Ev72qrN3WuUo5T1eBIoGQZO34QNRigwjgaGCHZMavnyE5puMN-89py8bv9E4P7MBGLF9n9XDH-B-5UtXew60Z5Snc1u94Lx1KQtwg7ux9G5L5HCg8oQS1PhX3zPYmLkROlRr0W1yN_P8h_osSPisUpwHoC_HwPbcPCY7D8qeJSHkLZsMLGGgBCCDl2DubPJJu9JpO__B1UnEoDQYbTpi-NzAjU-PpFi35q2l-IlEY12IRqoOYkYYc6JysJ804Vjj4G0LcbwkCSbw',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Ghế Sofa Vải Lông Cừu Cao Cấp',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    '15.000.000đ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber.shade500),
                      const SizedBox(width: 4),
                      const Text(
                        '4.8 (125 đánh giá)',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 1,
                        height: 18,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Đã bán 250+',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Màu sắc: Trắng Kem',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: List.generate(
                          colors.length,
                          (index) => GestureDetector(
                            onTap: () =>
                                setState(() => selectedColor = index),
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedColor == index
                                      ? AppColors.primary
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: colors[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Mô tả sản phẩm',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Mang đến sự sang trọng và ấm cúng cho không gian sống của bạn với Ghế Sofa Vải Lông Cừu. Thiết kế hiện đại, đường nét tinh tế cùng chất liệu vải lông cừu mềm mại, cao cấp. Khung gỗ sồi chắc chắn đảm bảo độ bền vượt trội theo thời gian.',
                        style: TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: const Border(
                    top: BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    )
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade100,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => setState(() {
                                if (quantity > 1) quantity--;
                              }),
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  setState(() => quantity++),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          icon: const Icon(Icons.shopping_cart_outlined),
                          label: const Text(
                            'Thêm vào giỏ hàng',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
            children: const [
              _NavShortcut(icon: Icons.home_outlined, label: 'Trang chủ'),
              _NavShortcut(icon: Icons.favorite_border, label: 'Yêu thích'),
              _NavShortcut(
                icon: Icons.shopping_bag,
                label: 'Giỏ hàng',
                isActive: true,
                badge: '3',
              ),
              _NavShortcut(icon: Icons.person_outline, label: 'Tài khoản'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roundIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.black.withValues(alpha: 0.1),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

class _NavShortcut extends StatelessWidget {
  const _NavShortcut({
    required this.icon,
    required this.label,
    this.isActive = false,
    this.badge,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : Colors.grey;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
        if (badge != null)
          Positioned(
            top: -4,
            right: -10,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                badge!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

