import 'package:flutter/material.dart';
import 'package:store_app_1/pages/cart_page.dart';
import 'package:store_app_1/pages/categories_page.dart';
import 'package:store_app_1/pages/home_page.dart';
import 'package:store_app_1/pages/on_sale_page.dart';
import 'package:store_app_1/pages/profile_page.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _TemplateState();
}

class _TemplateState extends State<Menu> {
  int _currentTabIndex = 0;

  void _showCart() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CartPage()));
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      HomePage(),
      CategoriesPage(),
      OnSalePage(),
      Profile()
    ];
    final _kBottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'Categories',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star_rounded),
        label: 'On Sale',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Profile',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart, size: 30),
              onPressed: () => _showCart())
        ],
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Market App",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26)),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: ListView(children: [
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  icon: Icon(Icons.clear, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(context).pop())),
          ListTile(
              leading: Icon(Icons.category, color: Colors.white, size: 30),
              title: Text("Manage Categories",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
          ListTile(
              leading: Icon(Icons.now_widgets, color: Colors.white, size: 30),
              title: Text("Manage Products",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
          ListTile(
              leading:
                  Icon(Icons.manage_accounts, color: Colors.white, size: 30),
              title: Text("Manage Users",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ]),
      ),
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTabIndex,
          backgroundColor: Theme.of(context).colorScheme.primary,
          items: _kBottomNavigationBarItems,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onSurface,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int index) {
            setState(() => _currentTabIndex = index);
          }),
    );
  }
}
