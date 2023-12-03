import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_shop_app/controllers/auth_controller.dart';
import 'package:multi_vendor_shop_app/views/screens/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  // const RegisterScreen({super.key});        this is the constructer ... here the data is shared from register to login screen
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  void singUp(String email, String fullName, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String res = "some error occured";
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    // return res;
  }

  late String email;

  late String fullName;

  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register Account",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                email = value;
              },
              validator: (value) {
                //here the value indicates that...the value which got when user enter the email while register
                if (value!.isEmpty) {
                  return "Please Email Address Must Not Be Empty";
                } else {
                  return null; //here null indicates do nothing..remains same
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email Address",
                hintText: "Enter email address",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.pink,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                fullName = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Full name must be not  empty";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Full Name",
                hintText: "Enter your full name",
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.pink,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Password must be not empty";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.pink,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  singUp(email, fullName, password);
                  print(email);
                  print(password);
                  print("success");
                } else {
                  print("Not Valid");
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              child: Text(
                "Already have an account?",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
