import 'package:banu_life/Pages/anasayfa_page.dart';
import 'package:banu_life/Pages/sifre_sifirlama_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final String kayitliKullaniciAdi = "Banu";
  final String kayitliSifre = "Banu123!";
  TextEditingController kullaniciController = TextEditingController();
  TextEditingController sifreController = TextEditingController();



  void _login()  {
    String girilenKullaniciAdi = kullaniciController.text;
    String girilenSifre = sifreController.text;


    // Sabit kullanıcı adı ve şifreyle karşılaştırma
    if (girilenKullaniciAdi == kayitliKullaniciAdi && girilenSifre == kayitliSifre) {
      // Giriş başarılı, ana sayfaya yönlendirme
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Anasayfa()),
      );
    } else {
      // Giriş başarısız, kullanıcıya hata mesajı gösterme
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Kullanıcı adı veya şifre hatalı!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.red],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(  // kullanıcı ikonu tanımladım
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              _page(),
            ],
          ),
        ),
        ),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 50),
            _inputField("Kullanıcı Adı", kullaniciController),
            const SizedBox(height: 20),
            _inputField("Şifre", sifreController, isPassword: true),
            const SizedBox(height: 50),
            _loginBtn(),
            const SizedBox(height: 20),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _icon() { // kullanıcı iconu
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  // giriş yap buttonu
  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: _login, // Giriş işlemi başlatma
      child: const SizedBox(
        width: double.infinity,
        child: Text("Giriş Yap", textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.blue)),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _extraText() {
    return GestureDetector(
      onTap: () {
        // Şifremi unuttum metnine tıklandığında şifre sıfırlama sayfasına yönlendirme
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SifreSifirlamaPage()),
        );
      },
      child: const Text(
        "Şifremi unuttum",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline),
      ),
    );
  }
}
