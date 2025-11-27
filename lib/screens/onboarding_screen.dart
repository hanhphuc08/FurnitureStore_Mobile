import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundLight,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: AspectRatio(
                      aspectRatio: 0.85,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuD9i1zgRF7yF_BS6gN6A3z871o4zIuGpzFnJnvUEnrbZInhmnV5S6m9tiqoTNW0NfOMoDth2P43SIDWuQELvC5bqm184wfeQJa9JWaIjQ9xMlCTnzClBFQuYg6-HKpgZLCwIhPHMMNbxan0LHKiENByl098raaObjdARillKc45sFv3VR_PTywVegKCiQiqBPh3p6-MV4T4EjOvCU7SmI_oGhfa6qusv8YSyLTu1D-uT_uzvgoHkhWpYPd_Wd68cv00LH0C2aZLHYHz',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Khám phá không gian sống mơ ước',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Giới thiệu bộ sưu tập sản phẩm nội thất đa dạng, chất lượng cao, giúp bạn kiến tạo ngôi nhà trong mơ.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.muted,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(isActive: true),
                          _buildDot(),
                          _buildDot(),
                          _buildDot(),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(HomeScreen.routeName),
                              child: const Text(
                                'Bỏ qua',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.muted,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(LoginScreen.routeName),
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.backgroundDark,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                              icon: const Icon(Icons.arrow_forward),
                              label: const Text(
                                'Tiếp tục',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildDot({bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? AppColors.primary
            : AppColors.primary.withValues(alpha: 0.3),
      ),
    );
  }
}

