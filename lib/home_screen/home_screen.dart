import 'package:flutter/material.dart';
import 'package:mobile_bank/account_screen/account_screen.dart';
import 'package:mobile_bank/card_page/card_page.dart';
import 'package:mobile_bank/transaction_report_page/transaction_report_page.dart';
import 'package:mobile_bank/withdraw_screen/withdraw_screen.dart';

import '../mobile_recharge_screen/mobile_recharge_screen.dart';
import '../pay_bill_screen/pay_bill_screen.dart';
import '../transfer_screen/transfer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // Makes the content scrollable
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Greeting Section
                const Text(
                  "Good Morning, Mphatso!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                // Account Card
                Stack(
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3A1C71), Color(0xFFFFAF7B)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Image.asset(
                        'assets/img.png', // Replace with Visa logo asset
                        height: 40,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mphatso Soko",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "OverBridge Expert",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "4756 •••• •••• 9018",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$3,469.52",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Quick Actions Grid
                GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  shrinkWrap: true, // Ensures GridView works inside SingleChildScrollView
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildActionButton(
                      icon: Icons.account_balance_wallet,
                      label: "Account Card", onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (
                            context) => const CardPage()),
                      );
                    },
                    ),
                    _buildActionButton(
                      icon: Icons.swap_horiz,
                      label: "Transfer",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) => const AccountPage()),
                        );
                      }
                    ),
                    _buildActionButton(
                      icon: Icons.money_off,
                      label: "Withdraw", onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                          context) => const WithdrawPage())
                        );
                    },
                    ),
                    _buildActionButton(
                      icon: Icons.phone_android,
                      label: "Recharge", onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => const MobileRechargeScreen())
                        );
                    },
                    ),
                    _buildActionButton(
                      icon: Icons.receipt,
                      label: "Pay the Bill", onTap: () {
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const PayBillScreen())
                        );
                    },
                    ),
                    _buildActionButton(
                      icon: Icons.credit_card,
                      label: "Credit Card", onTap: () {

                    },
                    ),
                    _buildActionButton(
                      icon: Icons.insert_chart,
                      label: "TransID Report", onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (
                            context) => const TransactionReportPage()),
                      );
                    },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar
    );
  }

  // Helper Method for Quick Action Buttons
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFEEF2FF),
            radius: 30,
            child: Icon(icon, color: const Color(0xFF3A1C71), size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}