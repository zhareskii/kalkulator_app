import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih sesuai tema
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple[100], // Warna ungu muda untuk avatar
              ),
              child: Icon(
                Icons.person, 
                size: 100, 
                color: Colors.purple[700], // Warna ikon ungu tua
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Zieyaoo",
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                color: Colors.purple[800], // Warna teks utama ungu tua
              ),
            ),
          ],
        ),
      ),
    );
  }
}
