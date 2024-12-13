import 'package:flutter/material.dart';

class PayBillDetailsScreen extends StatelessWidget {
  final String title;

  const PayBillDetailsScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            print('Back button pressed on $title details screen.');
            Navigator.pop(context);
          },
        ),
      ),
      body: PayBillForm(title: title),
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
        onTap: (index) {
          print('Bottom navigation item $index tapped.');
        },
      ),
    );
  }
}

class PayBillForm extends StatefulWidget {
  final String title;

  const PayBillForm({required this.title, super.key});

  @override
  State<PayBillForm> createState() => _PayBillFormState();
}

class _PayBillFormState extends State<PayBillForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCompany;
  final _billCodeController = TextEditingController();

  final List<String> companies = ['Company A', 'Company B', 'Company C'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Choose company',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    value: _selectedCompany,
                    items: companies
                        .map(
                          (company) => DropdownMenuItem(
                        value: company,
                        child: Text(company),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      print('Selected company: $value');
                      setState(() {
                        _selectedCompany = value;
                      });
                    },
                    validator: (value) => value == null ? 'Please select a company' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _billCodeController,
                    decoration: InputDecoration(
                      labelText: 'Bill code',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Please enter a bill code' : null,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please enter the correct bill code to check information.',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Form submitted with company: $_selectedCompany and bill code: ${_billCodeController.text}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FinalizeTransactionScreen(),
                          ),
                        );
                      }
                    },
                    child: const Center(
                      child: Text(
                        'Check',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalizeTransactionScreen extends StatelessWidget {
  const FinalizeTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Finalize Transaction',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            print('Back button pressed on Finalize Transaction screen.');
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Finalize your transaction here.',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}
