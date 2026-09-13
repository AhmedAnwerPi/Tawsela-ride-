import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/captain_login.dart';
import 'screens/passenger_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TawselaApp());
}

class TawselaApp extends StatelessWidget {
  const TawselaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tawsela Ride',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tawsela Ride')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PassengerLoginScreen())),
              child: const Text('Passenger Login'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CaptainLoginScreen())),
              child: const Text('Captain Login'),
            ),
          ],
        ),
      ),
    );
  }
}
