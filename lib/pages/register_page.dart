import 'package:flutter/material.dart';

import '../auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // get auth service
  final authService = AuthService();

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
// sign up button pressed
  void signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // check password match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords doesnt match")));
      return;
    }

// sigh nup attempt..
    try {
      await authService.signUpWithEmailPassword(email, password);

      //pop page
      Navigator.pop(context);
    }
    // catch errors
    catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
          children: [
            //
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            //password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
            ),

            //confirm password
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: "Confirm Password"),
            ),

            const SizedBox(
              height: 12,
            ),

            //button login
            ElevatedButton(
              onPressed: signUp,
              child: const Text("Sign Up"),
            ),
          ],
        ));
  }
}
