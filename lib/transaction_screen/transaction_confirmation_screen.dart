import 'package:flutter/material.dart';
import 'package:mobile_bank/app_route.dart';

class TransactionConfirmationScreen extends StatefulWidget {
  final String recipientName;
  final String accountNumber;
  final String profileImageUrl;
  final double amount;
  final bool? cardLast4Digits;
  final bool? cardBalance;

  const TransactionConfirmationScreen({
    super.key,
    required this.recipientName,
    required this.accountNumber,
    required this.profileImageUrl,
    required this.amount,  this.cardLast4Digits,  this.cardBalance,
  });

  @override
  State<TransactionConfirmationScreen> createState() =>
      _TransactionConfirmationScreenState();
}

class _TransactionConfirmationScreenState
    extends State<TransactionConfirmationScreen> {
  // Dummy card data
  final List<Map<String, dynamic>> cards = [
    {"last4Digits": "2236", "balance": 5300.00, "type": "MasterCard"},
    {"last4Digits": "5678", "balance": 1500.00, "type": "Visa"},
  ];

  late Map<String, dynamic> selectedCard;

  @override
  void initState() {
    super.initState();
    selectedCard = cards[0]; // Default to the first card
  }

  void _selectCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select a Card",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...cards.map((card) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard = card;
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              card['type'] == "MasterCard"
                                  ? Icons.credit_card
                                  : Icons.credit_score,
                              size: 40,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "**** ${card['last4Digits']}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Balance: \$${card['balance'].toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  void _confirmTransaction(BuildContext context) {
    double transactionFee = 2.5;
    double totalAmount = widget.amount + transactionFee;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          title: const Text("Confirm Transaction"),
          content: Text(
            "Are you sure you want to send \$${widget.amount.toStringAsFixed(2)} to ${widget.recipientName}?\n\n"
                "Transaction Fee: \$${transactionFee.toStringAsFixed(2)}\n"
                "Total: \$${totalAmount.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
             ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  // Navigate to Transaction Confirmation Screen
                  Navigator.pushNamed(context, AppRoute.succScreen);
                },
                child: const Text('Conform'),
              ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double transactionFee = 2.5;
    double totalAmount = widget.amount + transactionFee;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Transfer Money To",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 24),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(widget.profileImageUrl),
            ),
            const SizedBox(height: 16),
            Text(
              widget.recipientName,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              widget.accountNumber,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount: \$${widget.amount.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Fee: \$${transactionFee.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const Divider(height: 24, thickness: 1),
                  Text(
                    "Total: \$${totalAmount.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => _selectCard(context),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF3A1C71),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3A1C71), Color(0xFFD76D77)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Select Card",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _confirmTransaction(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: const Color(0xFF3A1C71),
              ),
              child: const Text(
                "Send",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
