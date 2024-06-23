import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../forgot_password/forgot_password_view.dart';
import '../register/register_view.dart';
import 'login_view_model.dart';
import '../../my_stations/my_stations_view.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final LoginViewModel _viewModel = LoginViewModel();
  String _verificationId = '';
  bool _codeSent = false;

  void _verifyPhoneNumber() async {
    await _viewModel.verifyPhoneNumber(
      _phoneController.text,
      (PhoneAuthCredential credential) async {
        User? user = await _viewModel.signInWithCredential(credential);
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyStations()),
          );
        }
      },
      (FirebaseAuthException e) {
        _showErrorDialog('Doğrulama başarısız: ${e.message}');
      },
      (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
          _codeSent = true;
        });
      },
      (String verificationId) {
        setState(() {
          _verificationId = verificationId;
          _codeSent = true;
        });
      },
    );
  }

  void _signInWithPhoneNumber() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _codeController.text,
    );

    User? user = await _viewModel.signInWithCredential(credential);
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyStations()),
      );
    } else {
      _showErrorDialog('Giriş başarısız. Lütfen tekrar deneyin.');
    }
  }

  void _navigateToForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordView()),
    );
  }

  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterView()),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hata'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Geri butonu işlevi
          },
        ),
        title: Text(
          'Login Ol',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (!_codeSent)
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Telefon numaranızı girin',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              if (_codeSent)
                TextField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    hintText: 'Doğrulama kodu',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[300],
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: _codeSent ? _signInWithPhoneNumber : _verifyPhoneNumber,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                  child: Text(_codeSent ? 'Doğrulama Kodunu Girin' : 'Giriş Yap'),
                ),
              ),
              TextButton(
                onPressed: _navigateToForgotPassword,
                child: Text('Şifremi Unuttum', style: TextStyle(color: Colors.purple[300])),
              ),
              TextButton(
                onPressed: _navigateToRegister,
                child: Text('Hesabınız yok mu?', style: TextStyle(color: Colors.purple[300])),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.purple[50],
    );
  }
}
