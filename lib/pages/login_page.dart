import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// get auth service
  final authService = AuthService();

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // login button pressed
  void login() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    // attempt login
    try {
      await authService.signInWithEmailPassword(email, password);
    }
    // catch errors
    catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

// UI build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        const SizedBox(
          height: 12,
        ),

        //button login
        ElevatedButton(
          onPressed: login,
          child: const Text("Login"),
        ),

        const SizedBox(
          height: 12,
        ),

        // register page signup

        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              )),
          child: const Center(child: Text("Don't have an account? Sign up")),
        )
      ],
    ));
  }
}
