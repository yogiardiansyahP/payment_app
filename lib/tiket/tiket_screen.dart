import 'package:flutter/material.dart';
import 'package:tugas_kelas/history/history_screen.dart';
import 'package:tugas_kelas/setting/setting_screen.dart';
import 'package:tugas_kelas/tiket/tiket_model.dart';
import 'package:tugas_kelas/home/home.dart';
import 'package:tugas_kelas/tiket/tiket_screen.dart';


class TicketScreen extends StatefulWidget {
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final List<Ticket> tickets = [
    Ticket("Tiket Masuk Dewasa", "Nusantara", 50000),
    Ticket("Tiket Masuk Anak", "Nusantara", 20000),
    Ticket("Tiket Masuk Dewasa", "Mancanegara", 150000),
    Ticket("Tiket Parkir Mobil", "Nusantara", 10000),
  ];

  int _selectedIndex = 1;

  void _deleteTicket(int index) {
    setState(() {
      tickets.removeAt(index);
    });
  }

  void _editTicket(int index) {
    print("Edit tiket: ${tickets[index].name}");
  }

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Kelola Tiket",
          style: TextStyle(
              color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.blue),
            onPressed: () {
              print("Tambah tiket baru");
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  ticket.category,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(height: 8),
                Text(
                  "Rp. ${ticket.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.blue),
                      onPressed: () => _deleteTicket(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _editTicket(index),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: "Ticket",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/qris.png")),
            label: "QRIS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
      ),
    );
  }
}
