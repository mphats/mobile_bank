import 'package:flutter/material.dart';

import '../app_route.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({super.key});

  @override
  State<MobileRechargeScreen> createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  String? selectedBeneficiary;
  String? selectedPhoneNumber;
  String? selectedAmount;
  String? selectedCard;

  bool isReadyToConfirm = false;

  final List<Map<String, String>> beneficiaries = [
    {"name": "Mphatso", "phone": "+1234567890"},
    {"name": "Justin", "phone": "+9876543210"},
    {"name": "Emma", "phone": "+1234567890"},
    {"name": "Troy", "phone": "+9876543210"},
  ];

  final List<String> amounts = ['10', '20', '30', '50', '100'];
  final List<String> cards = [
    'VISA **** **** **** 1234',
    'MasterCard **** **** **** 5678',
    'AMEX **** **** **** 9012',
  ];

  void resetState() {
    setState(() {
      selectedBeneficiary = null;
      selectedPhoneNumber = null;
      selectedAmount = null;
      selectedCard = null;
      isReadyToConfirm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Mobile Prepaid',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account/Card Section
              const Text(
                'Choose account/card',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedCard,
                hint: const Text('Select Card'),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: cards
                    .map((card) => DropdownMenuItem(
                  value: card,
                  child: Text(card),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCard = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              const Text(
                'Available balance: \$10,000',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Directory Section
              const Text(
                'Directory',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: beneficiaries.length,
                  itemBuilder: (context, index) {
                    final beneficiary = beneficiaries[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedBeneficiary = beneficiary['name'];
                          selectedPhoneNumber = beneficiary['phone'];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.all(10),
                        width: 80,
                        decoration: BoxDecoration(
                          color: selectedBeneficiary == beneficiary['name']
                              ? Colors.blueAccent
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              radius: 25,
                              child: Text(
                                beneficiary['name']![0],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              beneficiary['name']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Phone Number Section
              const Text(
                'Phone number',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: selectedPhoneNumber,
                onChanged: (value) {
                  setState(() {
                    selectedPhoneNumber = value;
                    if (value.isEmpty) resetState();
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Enter phone number',
                ),
              ),
              // Amount Section

              const SizedBox(height: 20),
              const Text(
                'Choose amount',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedAmount,
                hint: const Text('Select Amount'),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: amounts
                    .map((amount) => DropdownMenuItem(
                  value: amount,
                  child: Text('\$$amount'),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAmount = value;
                    isReadyToConfirm = selectedPhoneNumber != null &&
                        selectedAmount != null &&
                        selectedCard != null;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Confirm Button
              Center(
                child: ElevatedButton(
                  onPressed: isReadyToConfirm
                      ? () {
                    // Proceed to Success Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessScreen(),
                      ),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isReadyToConfirm
                        ? Colors.blueAccent
                        : Colors.grey.shade300,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder for Success Screen

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Success Illustration Section
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Replace with your asset image
                  Image.asset(
                    'assets/img_2.png',
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Recharge Success!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'You have successfully paid mobile prepaid!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            // Confirm Button Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Home Screen
                  Navigator.pushNamed(context, AppRoute.homePage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo, // Button gradient color
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                child: const Text('Confirm'),
              ),
            ),

            // Footer Navigation Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavIcon(context, Icons.home, 'Home', isActive: true),
                  _buildNavIcon(context, Icons.search, 'Search'),
                  _buildNavIcon(context, Icons.mail_outline, 'Messages'),
                  _buildNavIcon(context, Icons.settings, 'Settings'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Navigation Icon Widget
  Widget _buildNavIcon(BuildContext context, IconData icon, String label,
      {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 28,
          color: isActive ? Colors.indigo : Colors.black54,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.indigo : Colors.black54,
          ),
        ),
      ],
    );
  }
}
