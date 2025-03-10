import 'package:flutter/material.dart';
import 'package:banu_life/app/theme.dart';
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Şifre Belirleme"),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Yeni şifrenizi girin.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Yeni Şifre",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Yeni şifreyi kaydetme işlemi simüle edilebilir
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Yeni şifre kaydedildi!")),
                );
              },
              child: const Text("Şifreyi Değiştir"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: const StadiumBorder(),
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}