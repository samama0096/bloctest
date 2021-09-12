import 'package:bloctest/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum screenStates { login, otp, loading }

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey? _scKey = GlobalKey();
  FirebaseAuth _auth = FirebaseAuth.instance;
  var screenState = screenStates.login;
  TextEditingController phoneCont = TextEditingController();
  TextEditingController otpCont = TextEditingController();
  var verf_ID;

  getLoginScreen() {
    return Center(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: phoneCont,
              ),
            ),
            Container(
                height: 15,
                width: 50,
                child: TextButton(
                    onPressed: () {
                      _auth.verifyPhoneNumber(
                          phoneNumber: phoneCont.text,
                          verificationCompleted: (phoneCred) {
                            setState(() {
                              screenState = screenStates.otp;
                            });
                          },
                          verificationFailed: (c) {
                            setState(() {
                              screenState = screenStates.login;
                            });
                          },
                          codeSent: (verID, resendToken) {
                            setState(() {
                              screenState = screenStates.otp;
                              this.verf_ID = verID;
                            });
                          },
                          codeAutoRetrievalTimeout: (verfID) {});
                    },
                    child: Text("Send Otp")))
          ],
        ),
      ),
    );
  }

  getOtpScreen() {
    return Center(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: otpCont,
              ),
            ),
            Container(
                height: 15,
                width: 50,
                child: TextButton(
                    onPressed: () {
                      final phoneCredt = PhoneAuthProvider.credential(
                          verificationId: verf_ID, smsCode: otpCont.text);
                    },
                    child: Text("Verify Otp")))
          ],
        ),
      ),
    );
  }

  getLoadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scKey,
      appBar: AppBar(
          title: screenState == screenStates.login
              ? Text("Login")
              : Text("OTP verification")),
      body: screenState == screenStates.loading
          ? getLoadingScreen()
          : screenState == screenStates.otp
              ? getOtpScreen()
              : getLoginScreen(),
    );
  }
}
