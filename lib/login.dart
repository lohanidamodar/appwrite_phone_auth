import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text(
              "Welcome back",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20.0),
            Text(
              "Enter to Your Account",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20.0),
            const Text("Phone"),
            const SizedBox(height: 10.0),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () async {
                // login
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
