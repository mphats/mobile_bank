import 'package:flutter/material.dart';

import '../transaction_screen/transaction_confirmation_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferScreen> {
  final List<Map<String, String>> contacts = [
    {"name": "Jane Cooper", "phone": "123-456-7890", "account": "3246 **** **** 3422"},
    {"name": "Wade Warren", "phone": "987-654-3210", "account": "1111 **** **** 2222"},
    {"name": "Esther Howard", "phone": "555-666-7777", "account": "3333 **** **** 4444"},
    {"name": "Cameron Williamson", "phone": "444-333-2222", "account": "5555 **** **** 6666"},
    {"name": "Brooklyn Simmons", "phone": "111-222-3333", "account": "7777 **** **** 8888"},
    {"name": "Leslie Alexander", "phone": "999-888-7777", "account": "9999 **** **** 0000"},
    {"name": "Jenny Wilson", "phone": "123-456-7890", "account": "1111 **** **** 1234"},
    {"name": "Guy Hawkins", "phone": "321-654-9870", "account": "3333 **** **** 5555"},
    {"name": "Jacob Jones", "phone": "654-987-1234", "account": "7777 **** **** 9999"},
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // Filter contacts based on the search query
    final filteredContacts = contacts
        .where((contact) =>
    contact["name"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
        contact["phone"]!.contains(searchQuery))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Transfer money to",
          style: TextStyle(
            color: Color(0xFF3A1C71),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3A1C71)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value; // Update search query
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Write name, phone or card number",
                  hintStyle: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.search, color: Color(0xFFB3B3B3)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Contacts List
            Expanded(
              child: filteredContacts.isNotEmpty
                  ? ListView.separated(
                itemCount: filteredContacts.length,
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color(0xFFE0E0E0),
                ),
                itemBuilder: (context, index) {
                  final contact = filteredContacts[index];
                  return ListTile(
                    onTap: () {
                      // Navigate to the TransactionConfirmationScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionConfirmationScreen(
                            recipientName: contact["name"]!,
                            accountNumber: contact["account"]!,
                            profileImageUrl:
                            "https://via.placeholder.com/150?text=${contact['name']![0]}",
                            amount: 320.00,
                            cardLast4Digits: false,
                            cardBalance: false,
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://via.placeholder.com/150?text=${contact['name']![0]}"), // Replace with contact image if available
                      backgroundColor: const Color(0xFFF5F5F5),
                    ),
                    title: Text(
                      contact["name"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      contact["phone"]!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF757575),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Color(0xFFB3B3B3)),
                  );
                },
              )
                  : const Center(
                child: Text(
                  "No contacts found",
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF3A1C71),
        unselectedItemColor: const Color(0xFFB3B3B3),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
          ),
        ],
      ),
    );
  }
}

