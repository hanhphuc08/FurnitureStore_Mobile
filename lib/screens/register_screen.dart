import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassword = true;
  bool obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.chair, color: AppColors.primary, size: 40),
                  SizedBox(width: 8),
                  Text(
                    'Furni.',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Tạo tài khoản mới',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Bắt đầu hành trình khám phá nội thất của bạn.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 32),
              _buildInputField(
                label: 'Họ và Tên',
                hint: 'Nhập họ và tên của bạn',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 18),
              _buildInputField(
                label: 'Email',
                hint: 'Nhập địa chỉ email',
                icon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 18),
              _buildInputField(
                label: 'Mật khẩu',
                hint: 'Nhập mật khẩu',
                icon: Icons.lock_outline,
                obscure: obscurePassword,
                onToggle: () =>
                    setState(() => obscurePassword = !obscurePassword),
              ),
              const SizedBox(height: 18),
              _buildInputField(
                label: 'Xác nhận Mật khẩu',
                hint: 'Nhập lại mật khẩu',
                icon: Icons.lock_outline,
                obscure: obscureConfirm,
                onToggle: () =>
                    setState(() => obscureConfirm = !obscureConfirm),
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.backgroundDark,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('Đăng ký'),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Hoặc tiếp tục với'),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _SocialCircle(
                    url: 'https://img.icons8.com/color/96/google-logo.png',
                  ),
                  SizedBox(width: 18),
                  _SocialCircle(
                    url: 'https://img.icons8.com/color/96/facebook-new.png',
                  ),
                  SizedBox(width: 18),
                  _SocialCircle(
                    url: 'https://img.icons8.com/ios-filled/100/000000/mac-os.png',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Đã có tài khoản?'),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(LoginScreen.routeName),
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscure = false,
    VoidCallback? onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscure,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            suffixIcon: onToggle != null
                ? IconButton(
                    onPressed: onToggle,
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialCircle extends StatelessWidget {
  const _SocialCircle({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        alignment: Alignment.center,
        child: Image.network(url, height: 24, width: 24),
      ),
    );
  }
}

