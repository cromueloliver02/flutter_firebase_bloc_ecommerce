import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class UserPage extends StatelessWidget {
  static const id = '/user';

  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'User'),
      ),
      bottomNavigationBar: const ECMBottomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ECMButton(
              labelText: 'Logout',
              onPressed: () {
                context.read<AuthBloc>().add(SignOutRequestedEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
