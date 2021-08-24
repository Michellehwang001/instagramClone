import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:instagram_clone/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Instagram Clone',
              style: GoogleFonts.pacifico(fontSize: 40.0),
              //style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
            ),
            // ElevatedButton.icon(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.white,
            //     onPrimary: Colors.black,
            //     minimumSize: Size(double.infinity, 50),
            //   ),
            //   icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
            //   label: Text('Sign up with Google'),
            //   onPressed: () {},
            // ),
            SignInButton(Buttons.Google,
                text: '구글로 로그인 하세요.', onPressed: () {
                  final provider = context.read<GoogleSignInProvider>();
                  provider.googleLogin();
                }),
          ],
        ),
      ),
    );
  }
}