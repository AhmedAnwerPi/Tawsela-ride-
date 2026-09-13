import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CaptainLoginScreen extends StatefulWidget {
  const CaptainLoginScreen({super.key});
  @override
  State<CaptainLoginScreen> createState() => _CaptainLoginScreenState();
}

class _CaptainLoginScreenState extends State<CaptainLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _isLoading = true; _errorMessage = null; });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Success')));
    } on FirebaseAuthException catch (error) {
      setState(() { _errorMessage = 'Email or password incorrect'; });
    } finally { setState(() { _isLoading = false; }); }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Captain Login')), body: Padding(padding: const EdgeInsets.all(24), child: Form(key: _formKey, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Required' : null,), const SizedBox(height: 16), TextFormField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Required' : null,), const SizedBox(height: 16), if (_errorMessage != null) Text(_errorMessage!, style: const TextStyle(color: Colors.red)), const SizedBox(height: 16), FilledButton(onPressed: _isLoading ? null : _login, child: Text(_isLoading ? 'Loading...' : 'Login')),],),);
  }
                                                                                      }
