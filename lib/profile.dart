import 'package:appwrite_phone_auth/providers/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(AuthState.provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          if (authState.user?.name != null) ...[
            Text(authState.user!.name),
            const SizedBox(height: 10.0),
          ],
          Text(authState.user!.phone),
        ],
      ),
    );
  }
}
