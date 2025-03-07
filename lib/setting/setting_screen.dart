import 'package:flutter/material.dart';
import 'package:tugas_kelas/home/home.dart';
import 'package:tugas_kelas/tiket/tiket_screen.dart';
import 'package:tugas_kelas/history/history_screen.dart';


class Settings_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting", style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSettingCard(
                  icon: Icons.print,
                  title: "Printer",
                  subtitle: "Kelola printer",
                  color: Colors.blue.shade100,
                  onTap: () {},
                ),
                SizedBox(width: 16),
                _buildSettingCard(
                  icon: Icons.exit_to_app,
                  title: "Logout",
                  subtitle: "Keluar dari aplikasi",
                  color: Colors.green.shade100,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildSettingCard(
              icon: Icons.sync,
              title: "Sync Data",
              subtitle: "Sinkronasi online",
              color: Colors.pink.shade100,
              onTap: () {},
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // Tab Setting aktif
        onTap: (index) {
          _onItemTapped(context, index);
        },
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
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
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
    }
  }

  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(icon, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
