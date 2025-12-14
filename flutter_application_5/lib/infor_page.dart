import 'package:flutter/material.dart';
import 'package:flutter_application_5/api/user.dart';

class InfoPage extends StatelessWidget {
  final User user;
  const InfoPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thông tin user")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.image)),
            const SizedBox(height: 16),
            Text("Username: ${user.username}"),
            Text("Email: ${user.email}"),
            Text("Name: ${user.firstName} ${user.lastName}"),
            const SizedBox(height: 10),
            Text(
              "Token:\n${user.accessToken}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
