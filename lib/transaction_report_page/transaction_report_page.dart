import 'package:flutter/material.dart';

class TransactionReportPage extends StatelessWidget {
  const TransactionReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample transaction data
    final List<Map<String, dynamic>> transactions = [
      {
        'title': 'Water Bill',
        'amount': '-\$280',
        'status': 'Unsuccessfully',
        'date': 'Today',
        'icon': Icons.water_drop,
        'iconColor': Colors.blue,
      },
      {
        'title': 'Income: Salary Oct',
        'amount': '+\$1200',
        'status': 'Successfully',
        'date': 'Yesterday',
        'icon': Icons.wallet,
        'iconColor': Colors.red,
      },
      {
        'title': 'Electric Bill',
        'amount': '-\$480',
        'status': 'Successfully',
        'date': 'Yesterday',
        'icon': Icons.electric_bolt,
        'iconColor': Colors.blue,
      },
      {
        'title': 'Income: Jane Transfers',
        'amount': '+\$500',
        'status': 'Successfully',
        'date': 'Yesterday',
        'icon': Icons.account_balance_wallet,
        'iconColor': Colors.orange,
      },
      {
        'title': 'Internet Bill',
        'amount': '-\$100',
        'status': 'Successfully',
        'date': 'Yesterday',
        'icon': Icons.wifi,
        'iconColor': Colors.green,
      },
      {
        'title': 'Electric Bill',
        'amount': '-\$40',
        'status': 'Successfully',
        'date': 'Yesterday',
        'icon': Icons.electric_bolt,
        'iconColor': Colors.blue,
      },
      {
        'title': 'Income: Jane Transfers',
        'amount': '+\$500',
        'status': 'Successfully',
        'date': 'Yesterday',
        'icon': Icons.account_balance_wallet,
        'iconColor': Colors.orange,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction Report',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final isHeader = index == 0 ||
                transaction['date'] != transactions[index - 1]['date'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isHeader)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      transaction['date'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: transaction['iconColor'],
                      child: Icon(
                        transaction['icon'],
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      transaction['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      transaction['status'],
                      style: TextStyle(
                        fontSize: 14,
                        color: transaction['status'] == 'Successfully'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    trailing: Text(
                      transaction['amount'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: transaction['amount'].startsWith('-')
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0, // Set the active index
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle bottom navigation taps
          if (index == 0) Navigator.pop(context); // Example: Go Home
        },
      ),
    );
  }
}
