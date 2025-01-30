import 'package:flutter/material.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Market App")),
      body: Center(child: Text("Manage Users Page")),
    );
  }
}