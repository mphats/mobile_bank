import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../transaction_screen/transaction_screen.dart';
import 'ButtonWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> transactionHistory = [
    {"date": "2024-12-01", "amount": "\$250.00", "status": "Sent"},
    {"date": "2024-12-03", "amount": "\$500.00", "status": "Received"},
    {"date": "2024-12-05", "amount": "\$100.00", "status": "Sent"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.account_balance_wallet_sharp, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              'My Dashboard',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          // Account Balance Section
          Text(
            "Account Balance",
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$12,345.67",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                  ),
                ),
                const Icon(Icons.account_balance_wallet, size: 40, color: Colors.deepPurple),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://img.freepik.com/free-photo/young-fashionable-guy-sitting-cafe-with-smartphone_273609-12857.jpg?t=st=1733432392~exp=1733435992~hmac=3ca069c920443eed80053bf06ba33b005d4641874562be8b7f7dffe1752a736f&w=740',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          // Transaction History Section
          Text(
            "Transaction History",
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: transactionHistory.map((transaction) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Icon(
                    transaction["status"] == "Received" ? Icons.arrow_downward : Icons.arrow_upward,
                    color: transaction["status"] == "Received" ? Colors.green : Colors.red,
                  ),
                  title: Text(
                    transaction["amount"]!,
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    transaction["date"]!,
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                  ),
                  trailing: Text(
                    transaction["status"]!,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: transaction["status"] == "Received" ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          // Button to Transaction Page
          const ButtonWidgets(screenBtn: TransactionScreen()),
        ],
      ),
    );
  }
}

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Transaction Page',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Text(
          'Transaction Page Content Here',
          style: GoogleFonts.poppins(fontSize: 16),
        ),
      ),
    );
  }
}
