import 'package:flutter/material.dart';
import 'package:expense_manager_2025/widgets/custom_text_field.dart';
import 'package:expense_manager_2025/widgets/custom_button.dart';
import 'package:expense_manager_2025/services/auth_service.dart';

import '../ widgets/custom_button.dart';
import '../ widgets/custom_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: nameController,
              label: 'Name',
              icon: Icons.person,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: emailController,
              label: 'Email',
              icon: Icons.email,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Register',
              onPressed: () async {
                try {
                  await AuthService.register(
                    nameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration successful')),
                  );
                  Navigator.pushNamed(context, '/login');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
