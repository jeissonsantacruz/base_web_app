import 'package:base_web_app/presentation/microfront1_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Microfrontends en Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const Microfrontend1Screen()));
              },
              child: const Text('Abrir Microfrontend 1'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
