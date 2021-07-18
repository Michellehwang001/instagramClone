import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Instagram Clone', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              SizedBox(
                height: 40.0,
              ),
              SignInButton(Buttons.Google, text: '구글로 로그인 하세요.', onPressed: () {}),
            ],
          ),
        ),
    );
  }
}
