import 'package:flutter/material.dart';

class ManageProductsPage extends StatelessWidget {
  const ManageProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Market App")),
      body: Center(child: Text("Manage Products Page")),
    );
  }
}