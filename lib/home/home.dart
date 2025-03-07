import 'package:flutter/material.dart';
import 'package:tugas_kelas/payment/payment_screen.dart';
import 'package:tugas_kelas/setting/setting_screen.dart';
import 'package:tugas_kelas/tiket/tiket_model.dart';
import 'package:tugas_kelas/tiket/tiket_screen.dart';
import 'package:tugas_kelas/history/history_screen.dart'; 

class TicketPurchasePage extends StatefulWidget {
  @override
  _TicketPurchasePageState createState() => _TicketPurchasePageState();
}

class _TicketPurchasePageState extends State<TicketPurchasePage> {
  final List<Ticket> tickets = [
    Ticket("Tiket Masuk Dewasa", "Nusantara", 50000),
    Ticket("Tiket Masuk Anak", "Nusantara", 20000),
    Ticket("Tiket Masuk Dewasa", "Mancanegara", 150000),
    Ticket("Tiket Masuk Anak", "Mancanegara", 40000),
  ];

  int totalPrice = 0;
  int _selectedIndex = 0; 

  void updateTotalPrice() {
    setState(() {
      totalPrice = tickets.fold(
          0, (sum, ticket) => sum + (ticket.price * ticket.quantity));
    });
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
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
        title: Text("Penjualan",
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
                      Text(ticket.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(ticket.category,
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rp. ${ticket.price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline,
                                    color: Colors.blue),
                                onPressed: () {
                                  if (ticket.quantity > 0) {
                                    setState(() => ticket.quantity--);
                                    updateTotalPrice();
                                  }
                                },
                              ),
                              Text(ticket.quantity.toString(),
                                  style: TextStyle(fontSize: 16)),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline,
                                    color: Colors.blue),
                                onPressed: () {
                                  setState(() => ticket.quantity++);
                                  updateTotalPrice();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Rp. ${ticket.price * ticket.quantity}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Summary",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentPage()),
                            );
                          },
                          child: Text(
                            "Process",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Rp. $totalPrice",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num), label: "Ticket"),
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
