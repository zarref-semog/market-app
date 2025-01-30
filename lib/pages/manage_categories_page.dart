import 'package:flutter/material.dart';

class ManageCategoriesPage extends StatelessWidget {
  const ManageCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Market App")),
      body: Center(child: Text("Manage Categories Page")),
    );
  }
}