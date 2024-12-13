import 'package:flutter/material.dart';

import '../app_route.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed from TransactionConfirmationScreen
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Extract recipient name and amount from the arguments
    String recipientName = args?['recipientName'] ?? 'Unknown';
    double amount = args?['amount'] ?? 0.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '\$${amount.toStringAsFixed(2)} has been sent to $recipientName!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Home Screen
                Navigator.pushNamed(
                  context,
                   AppRoute.homePage// Remove all previous routes
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
