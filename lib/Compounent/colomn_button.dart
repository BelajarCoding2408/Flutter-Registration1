import 'package:flutter/material.dart';
import 'package:project_flutter_loginpage/Compounent/custom_button.dart';

/// Kolom input Email & Password — dipakai di layout Log In maupun Sign Up.
class EmailPasswordColumn extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final VoidCallback onToggleObscure;

  const EmailPasswordColumn({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.obscurePassword,
    required this.onToggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              hintText: 'Enter your email address...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: passwordController,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password...',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: onToggleObscure,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Kolom kumpulan tombol "Continue with ..." (Google, Apple, Binance, Wallet).
class ProviderButtonsColumn extends StatelessWidget {
  final List<String> providers;
  final void Function(String provider) onContinueWith;

  const ProviderButtonsColumn({
    super.key,
    required this.providers,
    required this.onContinueWith,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: providers
          .map(
            (p) => ProviderButton(
              provider: p,
              onPressed: () => onContinueWith(p),
            ),
          )
          .toList(),
    );
  }
}