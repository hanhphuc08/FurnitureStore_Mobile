import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'register_screen.dart';
import 'reset_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 280,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuD0j7W8MqJfDm_PgAUrYnHYi9HEYu8wehManl50ZVtbi9yO7lIwXDURyEi56mIdhMLt0riHTHpKHIV38CuF4n5NqgPUyJL95yhXCAkRRCGUanLhnP9zY6Ua88OqmACwJ0pmKQXFdI0aVBJltVWszenjPSkml5-fA5mIW1WifbHLhN0WSC_Bf3iYBPWT56jzIF_phWbJGQyNDriyrhSTB3MxWP0OZJpcSy6bpJ55GV10qdZ2Wxk1qE1lXDoPFrs6T6eJFTC-Ti13a78x',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Đăng Nhập Tài Khoản',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildLabeledField(
                      label: 'Email hoặc Số điện thoại',
                      child: TextField(
                        decoration: _inputDecoration(
                          hint: 'Nhập email hoặc số điện thoại của bạn',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildLabeledField(
                      label: 'Mật khẩu',
                      child: TextField(
                        obscureText: obscurePassword,
                        decoration: _inputDecoration(
                          hint: 'Nhập mật khẩu',
                          suffix: IconButton(
                            onPressed: () => setState(
                                () => obscurePassword = !obscurePassword),
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) =>
                              setState(() => rememberMe = value ?? false),
                          activeColor: AppColors.primary,
                        ),
                        const Text('Nhớ tôi'),
                        const Spacer(),
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(ResetPasswordScreen.routeName),
                          child: const Text(
                            'Quên mật khẩu?',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.lock_open_rounded),
                        label: const Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.backgroundDark,
                          shape: const StadiumBorder(),
                          textStyle: const TextStyle(
                            letterSpacing: 0.8,
                          ),
                          shadowColor: AppColors.primary.withOpacity(0.35),
                          elevation: 4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade400)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('Hoặc đăng nhập bằng'),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade400)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        _SocialButton(
                          assetUrl:
                              'https://img.icons8.com/color/96/google-logo.png',
                        ),
                        SizedBox(width: 18),
                        _SocialButton(
                          assetUrl:
                              'https://img.icons8.com/color/96/facebook-new.png',
                        ),
                        SizedBox(width: 18),
                        _SocialButton(
                          assetUrl:
                              'https://img.icons8.com/ios-filled/100/000000/mac-os.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Bạn là người dùng mới?'),
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(RegisterScreen.routeName),
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledField({
    required String label,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  InputDecoration _inputDecoration({required String hint, Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      suffixIcon: suffix,
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.assetUrl});

  final String assetUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 62,
        width: 62,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, 6),
              blurRadius: 14,
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        alignment: Alignment.center,
        child: ClipOval(
          child: Image.network(
            assetUrl,
            height: 28,
            width: 28,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

