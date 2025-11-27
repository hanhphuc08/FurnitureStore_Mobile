import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../widgets/main_bottom_nav.dart';
import 'home_screen.dart';
import 'cart_screen.dart';

class AiConsultScreen extends StatelessWidget {
  const AiConsultScreen({super.key});

  static const routeName = '/ai-consult';

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      'Gợi ý ghế sofa',
      'Màu sơn cho phòng ngủ?',
      'Phong cách nào đang hot?',
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Text(
                      'AI Tư vấn Nội thất',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.history),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: const [
                  _AiBubble(
                    message:
                        'Xin chào! Tôi là trợ lý AI. Tôi có thể giúp gì cho bạn trong việc thiết kế nội thất?',
                  ),
                  _UserBubble(
                    message: 'Tôi muốn tư vấn phòng khách chung cư 50m2.',
                  ),
                  _AiBubble(
                    message:
                        'Tuyệt vời! Bạn muốn theo phong cách nào? Hiện đại, tối giản hay Scandinavian?',
                    quickReplies: [
                      'Phong cách Hiện đại',
                      'Phong cách Tối giản',
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 54,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: suggestions.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) => Chip(
                  backgroundColor: Colors.white,
                  label: Text(suggestions[index]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Nhập câu hỏi...',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send, color: AppColors.primary),
                          onPressed: () {},
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNav(
        active: MainNavItem.consult,
        onTap: (item) => _onNavTap(context, item),
      ),
    );
  }

  void _onNavTap(BuildContext context, MainNavItem item) {
    if (item == MainNavItem.consult) return;
    switch (item) {
      case MainNavItem.home:
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        break;
      case MainNavItem.cart:
        Navigator.of(context).pushNamed(CartScreen.routeName);
        break;
      default:
        break;
    }
  }
}

class _AiBubble extends StatelessWidget {
  const _AiBubble({required this.message, this.quickReplies});

  final String message;
  final List<String>? quickReplies;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Text(message),
          ),
          if (quickReplies != null)
            Wrap(
              spacing: 8,
              children: quickReplies!
                  .map(
                    (text) => OutlinedButton(
                      onPressed: () {},
                      child: Text(text),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}

class _UserBubble extends StatelessWidget {
  const _UserBubble({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(
            color: AppColors.backgroundDark,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
