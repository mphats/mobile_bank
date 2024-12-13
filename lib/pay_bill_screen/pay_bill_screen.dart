import 'package:flutter/material.dart';
import 'package:mobile_bank/pay_bill_screen/pay_bill_details_screen.dart';

class PayBillScreen extends StatelessWidget {
  const PayBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pay the bill',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BillItem(
              title: 'Electric bill',
              description: 'Pay electric bill this month',
              image: Icons.bolt,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PayBillDetailsScreen(title: 'Electric bill'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BillItem(
              title: 'Water bill',
              description: 'Pay water bill this month',
              image: Icons.water_drop,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PayBillDetailsScreen(title: 'Water bill'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BillItem(
              title: 'Internet bill',
              description: 'Pay internet bill this month',
              image: Icons.wifi,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PayBillDetailsScreen(title: 'Internet bill'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16,),
            const Text(
              'Check Payment history',
              style: TextStyle(fontSize: 14, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class BillItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData image;
  final VoidCallback onTap;

  const BillItem({
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent.withOpacity(0.2),
              child: Icon(image, color: Colors.blueAccent),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

