import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                if(_phoneController.text.isEmpty()) {
                  return;
                }
                ref.read(AuthState.provider.notifier).createSession(_phoneController.text);
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
