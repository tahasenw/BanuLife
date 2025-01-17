import 'package:banu_life/Pages/login_page.dart';
import 'package:banu_life/Pages/register_page.dart';
import 'package:flutter/material.dart';

class RegisterLoginPage extends StatefulWidget {
  const RegisterLoginPage({super.key});

  @override
  State<RegisterLoginPage> createState() => _RegisterLoginPageState();
}

class _RegisterLoginPageState extends State<RegisterLoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors:[
              Colors.blue,
              Colors.red,
            ],)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textt(),
                const SizedBox(height: 100),
                _loginBtn(),
                const SizedBox(height: 30),
                _loginBtn2(),
              ],
            ),
          ),
        )

      ),
    );
  }

  Widget _textt(){
    return Column(
      children: [
      Text("Hemen Üye Ol!!",
      style: TextStyle(color:Colors.white, fontSize: 30),),
    Text("BanüLife'ın Tadını Çıkar.",
      style: TextStyle(color:Colors.white, fontSize: 30),),
      ],
    );
  }


  Widget _loginBtn(){
    return ElevatedButton(
      onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      },
      child: Container(
        width: 150, height: 25, alignment: Alignment.center,
        child: Text("Kayıt Ol",
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        shape:  StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _loginBtn2(){
    return ElevatedButton(
      onPressed: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: Container(
        width: 150, height: 25, alignment: Alignment.center,
        child: Text("Giriş Yap",
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        shape:  StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
