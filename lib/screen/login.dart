import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Email"),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: passController,
            decoration: InputDecoration(hintText: "Password"),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              authProvider.login(emailController.text.trim().toString(),
                  passController.text.trim().toString());
            },
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple.shade300),
                child: Center(
                  child: authProvider.loading
                      ? CircularProgressIndicator()
                      : Text("Login"),
                )),
          )
        ]),
      ),
    );
  }
}
