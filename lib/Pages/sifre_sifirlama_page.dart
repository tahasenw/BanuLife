import 'package:banu_life/Pages/yenisifresifirlama_page.dart';
import 'package:flutter/material.dart';

class SifreSifirlamaPage extends StatefulWidget {
  const SifreSifirlamaPage({super.key});

  @override
  State<SifreSifirlamaPage> createState() => _SifreSifirlamaPageState();
}

class _SifreSifirlamaPageState extends State<SifreSifirlamaPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Şifre Sıfırlama",
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
      body: Stack(
        children: [
          // Arka plan gradient'i
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Şifrenizi sıfırlamak için aşağıdaki bilgileri girin.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
                const SizedBox(height: 40),
                _inputField("E-posta Adresi veya Kullanıcı Adı", emailController),
                const SizedBox(height: 70),
                _resetButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // E-posta veya kullanıcı adı için input alanı
  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  // Şifre sıfırlama butonu
  Widget _resetButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String email = emailController.text;

        if (email.isNotEmpty) {
          // Şifre sıfırlama işlemi başarılı
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Şifre sıfırlama talebiniz alındı!")),
          );

          // Şifre sıfırlama işlemi tamamlandıktan sonra yeni sayfaya yönlendirme
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const YenisifresifirlamaPage(),
            ),
          );
        } else {
          // E-posta adresi boş girildiyse uyarı verilir
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Lütfen e-posta adresini girin!")),
          );
        }
      },
      child: _loginBtnn(),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  // Şifreyi sıfırlama butonunun tasarımı
  Widget _loginBtnn() {
    return Container(
      width: 150,
      height: 30,
      alignment: Alignment.center,
      child: const Text(
        "Şifreyi Sıfırla",
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }
}
