import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // supabase setup
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZxaXVhc25uY3pkYmRib3hsYnVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM0ODE4NTAsImV4cCI6MjA0OTA1Nzg1MH0.MikwhHVu2GLlBJllQ2MnfYRnYaLmqkVPzzS28qw7V5Q",
    url: "https://vqiuasnnczdbdboxlbuh.supabase.co",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthGate(),
    );
  }
}
