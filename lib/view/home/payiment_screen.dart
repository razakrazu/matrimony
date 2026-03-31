import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:matrimony_app/controller/payiment/payiment_controller.dart';

class PaymentScreen extends StatelessWidget {
   PaymentScreen({super.key});

PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              color: Colors.orange,
              child: Center(
                child: Text("A", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Acme Corp", style: TextStyle(fontSize: 16)),
                Text("Razorpay Trusted Business",
                    style: TextStyle(fontSize: 12)),
              ],
            )
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            sectionTitle("Preferred methods"),
            paymentTile(
              icon: Icons.account_balance,
              title: "ICICI Bank • xxxx 4411",
              subtitle: "UPI",
            ),

            paymentTile(
              icon: Icons.account_balance_wallet,
              title: "ICICI Bank - Netbanking",
            ),

            // 🔹 UPI Section
            sectionTitle("UPI, Cards & Other Methods"),

            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(10),
              decoration: boxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text("UPI", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          controller.openCheckout();
                        },
                        child: upiIcon("GPay")),
                      upiIcon("PhonePe"),
                      upiIcon("Paytm"),
                      upiIcon("Other"),
                    ],
                  )
                ],
              ),
            ),

            // 🔹 Other Options
            paymentTile(
              icon: Icons.credit_card,
              title: "Pay using card",
              subtitle: "All cards supported",
            ),

            paymentTile(
              icon: Icons.money,
              title: "Cash On delivery",
              subtitle: "Pay at time of delivery",
            ),

            paymentTile(
              icon: Icons.account_balance,
              title: "Net banking",
              subtitle: "All Indian banks",
            ),

            paymentTile(
              icon: Icons.calendar_month,
              title: "EMI",
              subtitle: "No cost EMI available",
            ),

            SizedBox(height: 80),
          ],
        ),
      ),

      // 🔻 BOTTOM BAR
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("₹ 1,850",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text("Continue"),
            )
          ],
        ),
      ),
    );
  }

  // 🔹 Section Title
  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // 🔹 Payment Tile
  Widget paymentTile({
    required IconData icon,
    required String title,
    String? subtitle,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: boxDecoration(),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  // 🔹 UPI Icons
  Widget upiIcon(String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          child: Text(name[0]),
        ),
        SizedBox(height: 5),
        Text(name),
      ],
    );
  }

  // 🔹 Box Decoration
  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    );
  }
}