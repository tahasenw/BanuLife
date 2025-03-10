import 'package:flutter/material.dart';

class SifreDegistirSayfa extends StatefulWidget {
  const SifreDegistirSayfa({super.key});
  @override
  State<SifreDegistirSayfa> createState() => _SifreDegistirSayfaState();
}

class _SifreDegistirSayfaState extends State<SifreDegistirSayfa> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      // Şifre değiştirme işlemi burada yapılacak
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Şifre başarıyla değiştirildi!')),
      );
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bu alan boş bırakılamaz!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:  Text('Şifreni Değiştir',
          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Mevcut Şifre
                TextFormField(
                  controller: _currentPasswordController,
                  obscureText: _obscureCurrentPassword,
                  decoration: InputDecoration(
                    labelText: 'Mevcut Şifre',
                    suffixIcon: IconButton(
                      icon: Icon(_obscureCurrentPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureCurrentPassword = !_obscureCurrentPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: _validatePassword,
                ),
                SizedBox(height: 16),

                // Yeni Şifre
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: _obscureNewPassword,
                  decoration: InputDecoration(
                    labelText: 'Yeni Şifre',
                    suffixIcon: IconButton(
                      icon: Icon(_obscureNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureNewPassword = !_obscureNewPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: _validatePassword,
                ),
                SizedBox(height: 16),

                // Yeni Şifreyi Tekrar Gir
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Yeni Şifreyi Tekrar Gir',
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != _newPasswordController.text) {
                      return 'Şifreler eşleşmiyor!';
                    }
                    return _validatePassword(value);
                  },
                ),
                SizedBox(height: 24),

                // Şifre Değiştir Butonu
                ElevatedButton(
                  onPressed: _changePassword,
                  child: Text('Şifreyi Değiştir', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
