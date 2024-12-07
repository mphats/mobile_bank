import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String selectedPaymentMethod = 'Credit Card';
  bool isFavorite = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // Validation Messages
  String? responseMessage;

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
              'Transaction',
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
          Text(
            "New Transaction",
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Fill in the details below",
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          // Recipient's Name TextField
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Recipient\'s Name',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              prefixIcon: const Icon(Icons.person, color: Colors.deepPurple),
            ),
          ),
          const SizedBox(height: 20),
          // Amount TextField
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Amount',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              prefixIcon: const Icon(Icons.attach_money, color: Colors.deepPurple),
            ),
          ),
          const SizedBox(height: 20),
          // Payment Method Dropdown
          DropdownButtonFormField<String>(
            value: selectedPaymentMethod,
            items: <String>['Credit Card', 'Bank Transfer', 'Mobile Money', 'PayPal']
                .map((String method) {
              return DropdownMenuItem<String>(
                value: method,
                child: Text(method),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Payment Method',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              prefixIcon: const Icon(Icons.payment, color: Colors.deepPurple),
            ),
          ),
          const SizedBox(height: 20),
          // Favorite Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mark as Favorite",
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Switch(
                value: isFavorite,
                activeColor: Colors.deepPurple,
                onChanged: (value) {
                  setState(() {
                    isFavorite = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Submit Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () {
              // Validate the input fields
              if (nameController.text.isEmpty || amountController.text.isEmpty) {

                _showSnackbar(context, 'Please fill in all fields.', Colors.red);
              } else if (double.tryParse(amountController.text) == null) {
                setState(() {
                  responseMessage = 'Please enter a valid amount.';
                });
                _showSnackbar(context, 'Please enter a valid amount.', Colors.red);
              } else {
                setState(() {
                  responseMessage = 'Transaction submitted successfully!';
                });
                // Optionally, you can reset fields or navigate to another page
                _showSnackbar(context, 'Transaction submitted successfully!', Colors.green);
              }

              // For demonstration, printing to console (useful for debugging)
              print('Name: ${nameController.text}');
              print('Amount: ${amountController.text}');
              print('Payment Method: $selectedPaymentMethod');
              print('Is Favorite: $isFavorite');
            },
            child: Text(
              'Submit',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          // Response message display
          if (responseMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                responseMessage!,
                style: TextStyle(
                  color: responseMessage!.contains('successfully') ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: const Duration(seconds: 2), // Show snackbar for 2 seconds
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}