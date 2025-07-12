import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController pswd_controller = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0),
          TextField(
            controller: email_controller,
            decoration: InputDecoration(
                labelText: "Enter Email",
                border: OutlineInputBorder(),
                errorText: _validate?"Email Value required":null
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: pswd_controller,
            decoration: InputDecoration(
                labelText: "Enter Password",
                border: OutlineInputBorder(),
                errorText: _validate ? "Password Value required":null
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(onPressed: () {
                String message = '';
                setState(() async {
                  email_controller.text.isEmpty?_validate = true :_validate=false;
                  pswd_controller.text.isEmpty?_validate = true :_validate=false;
                  if(_validate==false){
                    try {
                      await _firebaseAuth.createUserWithEmailAndPassword( // instantiated earlier on: final _firebaseAuth = FirebaseAuth.instance;
                        email: email_controller.text.toString().trim(),
                        password: pswd_controller.text.toString().trim(),
                      );
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (_) => const Flex(direction: Axis.horizontal),
                          ),
                        );
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        message = "${e.message}";
                      } else if (e.code == 'email-already-in-use') {
                        message = "${e.message}";
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
                    catch (e) {
                      Fluttertoast.showToast(
                        msg: "Failed: $e",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 14.0,
                      );
                    }
                  }
                });

              }, child: Text("Validate Fields")),
              SizedBox(width: 10),
              Text("Filled Button"),
            ],
          ),
        ],
      ),
    );
  }
}
