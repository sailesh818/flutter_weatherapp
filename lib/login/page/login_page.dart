import 'package:flutter/material.dart';
import 'package:my_profile/notification/push_notification_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  PushNotificationService pushNotificationService = PushNotificationService();

  @override
  void initState() {
    super.initState();
    pushNotificationService
      ..initialize()
      ..requestNotificationPermission()
      ..getFCMToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login Page'),
                SizedBox(height: 60),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA]+@[a-z]+").hasMatch(value)) {
                      return 'Enter a valid email!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 60),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),

                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r"^@[0-9]").hasMatch(value)) {
                      return 'Enter a valid email!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    if (_formkey.currentState?.validate() ?? false) {
                      Navigator.pushNamed(context, "/discover");
                    }
                    //Navigator.pushNamed(context, '/discover');
                  },
                  child: Text('Sign In', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
