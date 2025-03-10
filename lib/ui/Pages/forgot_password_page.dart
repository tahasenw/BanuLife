import 'package:banu_life/app/theme.dart';
import 'package:banu_life/ui/Pages/reset_password_page.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child:Stack(
              children: [
                Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Şifre Sıfırlama",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Şifrenizi sıfırlamak için aşağıdaki bilgileri girin.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 23, color: Colors.white),
                    ),
                    const SizedBox(height: 40),
                    _inputField("E-posta Adresi veya Kullanıcı Adı", emailController),
                    const SizedBox(height: 70),
                    _resetButton(context),
                  ],
                ),
              ),
            ),
              ],
            ),
          ),
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

    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Bu alan boş bırakılamaz';
        }
        return null;
      },
    );
  }

  // Şifre sıfırlama butonu
  Widget _resetButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          String email = emailController.text;

          // Şifre sıfırlama işlemi başarılı
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Şifre sıfırlama talebiniz alındı!")),
          );

          // Şifre sıfırlama işlemi tamamlandıktan sonra yeni sayfaya yönlendirme
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ResetPasswordPage(),
            ),
          );
        }
      },
      child: _resetButtonText(),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  // Şifreyi sıfırlama butonunun tasarımı
  Widget _resetButtonText() {
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
