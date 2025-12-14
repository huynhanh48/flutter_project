import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Title
              const Text(
                'Đăng Ký Tài Khoản',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              // Avatar icon
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person_add, size: 45, color: Colors.white),
              ),

              const SizedBox(height: 40),

              // Username
              _buildInput(icon: Icons.person, hint: 'Tên đăng nhập'),

              const SizedBox(height: 15),

              // Email
              _buildInput(icon: Icons.email, hint: 'Email'),

              const SizedBox(height: 15),

              // Password
              _buildInput(icon: Icons.lock, hint: 'Mật khẩu', isPassword: true),

              const SizedBox(height: 15),

              // Re-password
              _buildInput(
                icon: Icons.lock,
                hint: 'Nhập lại mật khẩu',
                isPassword: true,
              ),

              const SizedBox(height: 25),

              // Register button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'ĐĂNG KÝ',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Login text
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Đã có tài khoản? Quay lại đăng nhập',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Input field widget
  Widget _buildInput({
    required IconData icon,
    required String hint,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
