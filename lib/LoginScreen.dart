import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController pswd_controller = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Column(
        children: [
          SizedBox(height: 10.0),
          TextField(
            controller: email_controller,
            decoration: InputDecoration(
              labelText: "Enter Email",
              border: OutlineInputBorder(),
              errorText: _validate ? "Email Value required" : null,
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: pswd_controller,
            decoration: InputDecoration(
              labelText: "Enter Password",
              border: OutlineInputBorder(),
              errorText: _validate ? "Password Value required" : null,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () async {
                  setState(() {
                    if (email_controller.text.toString().isEmpty ||
                        pswd_controller.text.toString().isEmpty) {
                      _validate = true;
                    } else {
                      _validate = false;
                    }
                  });
                  String message = '';
                  if (!_validate) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email_controller.text.toString(),
                        password: pswd_controller.text.toString(),
                      );
                      Future.delayed(const Duration(seconds: 3), () {
                        Fluttertoast.showToast(
                          msg: "Success",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: 14.0,
                        );
                        print('success');
                        // Navigator.of(context, rootNavigator: true).push(
                        //   MaterialPageRoute(
                        //     builder: (_) => const Flex(direction: Axis.horizontal,),
                        //   ),
                        // );
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                        message = 'Invalid login credentials.';
                      } else {
                        message = e.code;
                      }
                      Fluttertoast.showToast(
                        msg: message,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 14.0,
                      );
                    }
                  } else {}
                },
                child: Text("Validate Fields"),
              ),
              SizedBox(width: 10),
              Text("Filled Button"),
            ],
          ),
        ],
      ),
    );
  }
}
