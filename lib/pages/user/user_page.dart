import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class UserPage extends StatelessWidget {
  static const id = '/user';

  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'User'),
      ),
      bottomNavigationBar: const ECMBottomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (ctx, state) {
            final user = state.user;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Profile Info',
                  style: textTheme.headline3,
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.account_box),
                  title: Text('${user.firstName} ${user.lastName}'),
                ),
                ListTile(
                  leading: const Icon(Icons.location_city),
                  title: Text(user.city),
                ),
                ListTile(
                  leading: const Icon(Icons.flag),
                  title: Text(user.country),
                ),
                ListTile(
                  leading: const Icon(Icons.gps_fixed),
                  title: Text('${user.zipCode}'),
                ),
                const Spacer(),
                ECMButton(
                  labelText: 'Logout',
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOutRequestedEvent());
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
