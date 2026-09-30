import 'package:flutter/material.dart';
import 'package:project_flutter_loginpage/Compounent/colomn_button.dart';
import 'package:project_flutter_loginpage/Compounent/custom_button.dart';

class login_clone extends StatefulWidget {
  const login_clone({super.key});

  @override
  State<login_clone> createState() => login_cloneState();
}

class login_cloneState extends State<login_clone> {
  bool _isLogin = true;
  bool _obscurePassword = true;
  bool _agreeUpdates = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static const List<String> _providers = ['Google', 'Apple', 'Binance', 'Wallet'];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final String email = _emailController.text;
    final String pesan = _isLogin
        ? 'Log In dengan email: $email'
        : 'Sign Up dengan email: $email';

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }

  void _continueWith(String provider) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Continue with $provider')));
  }

  Widget _buildTab(String label, bool isActive, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.blue : Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 3,
              color: isActive ? Colors.blue : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget providerButtons = ProviderButtonsColumn(
      providers: _providers,
      onContinueWith: _continueWith,
    );

    final Widget emailPasswordForm = EmailPasswordColumn(
      emailController: _emailController,
      passwordController: _passwordController,
      obscurePassword: _obscurePassword,
      onToggleObscure: () => setState(() => _obscurePassword = !_obscurePassword),
    );

    final Widget orDivider = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(_isLogin ? 'OR' : 'OR CONTINUE WITH EMAIL'),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('CoinMarketCap Clone')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                _buildTab('Log In', _isLogin, () {
                  setState(() => _isLogin = true);
                }),
                _buildTab('Sign Up', !_isLogin, () {
                  setState(() => _isLogin = false);
                }),
              ],
            ),

            const SizedBox(height: 20),
            if (_isLogin) ...[
              emailPasswordForm,
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot password?'),
                ),
              ),

              CustomElevatedButton(label: 'Log In', onPressed: _submit),
              orDivider,
              providerButtons,
            ] else ...[
              providerButtons,
              orDivider,
              emailPasswordForm,

              CheckboxListTile(
                value: _agreeUpdates,
                onChanged: (value) {
                  setState(() => _agreeUpdates = value ?? true);
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Please keep me updated by email with the latest crypto '
                  'news, research findings, reward programs, event updates, '
                  'coin listings and more information from CoinMarketCap.',
                  style: TextStyle(fontSize: 12),
                ),
              ),

              const SizedBox(height: 10),
              CustomElevatedButton(
                label: 'Create an account',
                onPressed: _submit,
              ),
            ],
          ],
        ),
      ),
    );
  }
}