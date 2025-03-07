import 'package:flutter/material.dart';
import 'package:tugas_kelas/home/home.dart';
import 'package:tugas_kelas/setting/setting_screen.dart';
import 'package:tugas_kelas/tiket/tiket_screen.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedIndex = 3; // History tab yang aktif

  final List<Map<String, String>> transactions = [
    {"title": "Penjualan", "time": "Hari ini, 10.00 WIB", "amount": "Rp. 140.000"},
    {"title": "Penjualan", "time": "Hari ini, 10.00 WIB", "amount": "Rp. 160.000"},
    {"title": "Penjualan", "time": "Hari ini, 10.00 WIB", "amount": "Rp. 200.000"},
    {"title": "Penjualan", "time": "Hari ini, 10.00 WIB", "amount": "Rp. 200.000"},
    {"title": "Penjualan", "time": "Hari ini, 10.00 WIB", "amount": "Rp. 150.000"},
    {"title": "Penjualan", "time": "Hari ini, 10.00 WIB", "amount": "Rp. 150.000"},
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TicketPurchasePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TicketScreen()), 
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HistoryScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Settings_Screen()), 
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction History", style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BULAN INI", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54)),
            SizedBox(height: 5),
            Text("Rp. 1.000.000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: index == 2 ? Colors.blue : Colors.grey.shade300,
                        width: index == 2 ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transactions[index]["title"]!,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(transactions[index]["time"]!,
                                style: TextStyle(color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                        Text(transactions[index]["amount"]!,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_num), label: "Ticket"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/qris.png")), label: "QRIS"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
      ),
    );
  }
}
  