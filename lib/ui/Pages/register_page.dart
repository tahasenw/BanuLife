
import 'package:banu_life/app/theme.dart';
import 'package:banu_life/ui/views/anasayfa/anasayfa.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final adsoyadController = TextEditingController();
  final okulnoController = TextEditingController();
  final emailController = TextEditingController();
  final sifreController = TextEditingController();

  bool _isLoading = false; // Yükleniyor göstergesi
  bool _passwordVisible = false; // Şifreyi göster/gizle
  bool _isFormValid = false; // Formun doluluk durumunu kontrol etmek için

  @override
  void initState() {
    super.initState();
    // Kullanıcının formu doldurduğunu takip edelim
    adsoyadController.addListener(_validateForm);
    okulnoController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    sifreController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid = adsoyadController.text.isNotEmpty &&
          okulnoController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          sifreController.text.isNotEmpty;
    });
  }

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // API çağrısı simülasyonu

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Kayıt başarılı!")),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Anasayfa()),
    );
  }

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
        body: Stack(
          children: [
            SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Kayıt Ol",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    const SizedBox(height: 50),
                    _inputField("Ad Soyad", adsoyadController, validator: validateAdSoyad),
                    const SizedBox(height: 20),
                    _inputField("Okul Numarası", okulnoController, maxLength: 10, isNumber: true),
                    const SizedBox(height: 20),
                    _inputField("Email Adresi", emailController, validator: validateEmail),
                    const SizedBox(height: 20),
                    _inputField("Şifre", sifreController, isPassword: true, validator: validatePassword),
                    const SizedBox(height: 50),
                    _registerButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
          ],
        ),
    );
  }

  Widget _inputField(
      String hintText,
      TextEditingController controller, {
        bool isPassword = false,
        int maxLength = 0,
        String? Function(String?)? validator,
        bool isNumber = false,
      }) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.white),
        ),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        )
            : null,
      ),
      obscureText: isPassword && !_passwordVisible,
      maxLength: maxLength > 0 ? maxLength : null,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      validator: validator,
    );
  }

  Widget _registerButton() {
    return ElevatedButton(
      onPressed: _isFormValid ? _registerUser : null, // Butonu form tamamlanmadıysa devre dışı bırak
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: const StadiumBorder(),
      ),
      child: _isLoading
          ? const CircularProgressIndicator(color: Colors.white) // Yüklenme göstergesi
          : const SizedBox(
        width: double.infinity,
        child: Text(
          "Kayıt Ol",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.blue),
        ),
      ),
    );
  }

  String? validateAdSoyad(String? adSoyad) {
    final adSoyadRegExp = RegExp(r"^[a-zA-ZçğıöşüÇĞİÖŞÜ ]+$");
    if (adSoyad == null || adSoyad.isEmpty) return "Lütfen ad soyad girin.";
    if (!adSoyadRegExp.hasMatch(adSoyad)) return "Ad soyad sadece harf ve boşluktan oluşmalıdır.";
    return null;
  }

  String? validateEmail(String? email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (email == null || email.isEmpty) return "Lütfen email adresinizi girin.";
    if (!emailRegExp.hasMatch(email)) return "Lütfen geçerli bir email adresi girin.";
    return null;
  }

  String? validatePassword(String? password) {
    final passwordRegExp = RegExp(r"^(?=.*[A-ZÇĞİÖŞÜ])(?=.*[a-zçğıöşü])(?=.*\d)(?=.*[@$!%*?&]).{6,}$");
    if (password == null || password.isEmpty) return "Lütfen bir şifre girin.";
    if (!passwordRegExp.hasMatch(password)) return "Şifre en az 6 karakter, bir büyük harf, bir küçük harf, bir rakam ve bir özel karakter içermelidir.";
    return null;
  }
}
