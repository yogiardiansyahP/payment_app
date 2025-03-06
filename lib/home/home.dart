import 'package:flutter/material.dart';
import 'package:tugas_kelas/tiket/tiket_screen.dart';
import 'package:tugas_kelas/payment/payment_screen.dart';

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

  void updateTotalPrice() {
    setState(() {
      totalPrice = tickets.fold(0, (sum, ticket) => sum + (ticket.price * ticket.quantity));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Penjualan", style: TextStyle(color: Colors.blue)),
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
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ticket.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(ticket.category, style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rp. ${ticket.price}", style: TextStyle(fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    if (ticket.quantity > 0) {
                                      setState(() => ticket.quantity--);
                                      updateTotalPrice();
                                    }
                                  },
                                ),
                                Text(ticket.quantity.toString(), style: TextStyle(fontSize: 16)),
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
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
                          child: Text("Rp. ${ticket.price * ticket.quantity}",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Summary", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("Rp. $totalPrice", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPage()),
                      );
                    },
                    child: Text("Process"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_num), label: "Ticket"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/qris.png")), label: "qris"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        selectedItemColor: const Color.fromARGB(255, 13, 96, 204),
        unselectedItemColor: const Color.fromARGB(255, 75, 79, 83),
        selectedFontSize: 14,
        unselectedFontSize: 12,
      ),
    );
  }
}
