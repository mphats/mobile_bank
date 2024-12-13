import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  String selectedMethod = 'Mobile Wallet';
  String selectedWallet = 'Airtel Money';
  String selectedCurrency = 'USD';

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  // Map to hold network images for each method
  final Map<String, String> methodImages = {
    'Mobile Wallet': 'https://img.freepik.com/free-photo/shallow-focus-two-young-african-males-sharing-content-through-their-phones_181624-44999.jpg?t=st=1733657910~exp=1733661510~hmac=a882f541acf62d60dd5ede00f99b2f197828be459f8d7686760be398de06ba00&w=740',
    'Bank Account': 'https://cdn-icons-png.flaticon.com/512/4320/4320337.png',
    'PayPal': 'https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Deposit Funds',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            // Title with Icon or Image
            Column(
              children: [

                const SizedBox(height: 10),
                Image.network(
                  methodImages[selectedMethod]!,
                  height: 80,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Method Selection Dropdown
            DropdownButtonFormField<String>(
              value: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                  phoneNumberController.clear();
                  passwordController.clear();
                  accountNumberController.clear();
                });
              },
              items: [
                'Mobile Wallet',
                'Bank Account',
                'PayPal',
              ].map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(
                    method,
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Change Deposit Method',
                labelStyle: GoogleFonts.poppins(fontSize: 16),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            // Specific Mobile Wallet Options
            if (selectedMethod == 'Mobile Wallet') ...[
              Text(
                "Select Mobile Wallet",
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedWallet,
                onChanged: (value) {
                  setState(() {
                    selectedWallet = value!;
                  });
                },
                items: [
                  'Airtel Money',
                  'TNM Mpamba',
                ].map((wallet) {
                  return DropdownMenuItem(
                    value: wallet,
                    child: Text(
                      wallet,
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Wallet',
                  labelStyle: GoogleFonts.poppins(fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              // Phone Number
              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: GoogleFonts.poppins(fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              // Password
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.poppins(fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
            // Bank Account Details
            if (selectedMethod == 'Bank Account') ...[
              TextField(
                controller: accountNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  labelStyle: GoogleFonts.poppins(fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.poppins(fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
            const SizedBox(height: 20),
            // Currency Selection Dropdown
            Text(
              "Select Currency",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCurrency,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
              items: [
                'USD',
                'EUR',
                'ZAR',
                'MWK',
              ].map((currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(
                    currency,
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Currency',
                labelStyle: GoogleFonts.poppins(fontSize: 16),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            // Input for Amount
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
                labelStyle: GoogleFonts.poppins(fontSize: 16),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 30),
            // Confirm Button
            ElevatedButton(
              onPressed: () {
                String message = "Withdrawal Requested via $selectedMethod";
                if (selectedMethod == 'Mobile Wallet') {
                  message +=
                  " ($selectedWallet) with phone ${phoneNumberController.text}";
                } else if (selectedMethod == 'Bank Account') {
                  message += " with account ${accountNumberController.text}";
                }
                message += " in $selectedCurrency.";

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      message,
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Confirm Withdrawal',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
