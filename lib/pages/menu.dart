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

  Widget _drawer() {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  icon: Icon(Icons.clear, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(context).pop())),
          ListTile(
              leading: Icon(Icons.category, color: Colors.white, size: 30),
              title: Text("Manage Categories",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(color: Colors.white),
          ),
          ListTile(
              leading: Icon(Icons.now_widgets, color: Colors.white, size: 30),
              title: Text("Manage Products",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(color: Colors.white),
          ),
          ListTile(
              leading:
                  Icon(Icons.manage_accounts, color: Colors.white, size: 30),
              title: Text("Manage Users",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ]),
      ),
    );
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
          Stack(alignment: Alignment.topLeft, children: [
            IconButton(
                icon: Icon(Icons.shopping_cart, size: 30),
                onPressed: () => _showCart()),
            Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Text("99", style: TextStyle(color: Colors.white)))),
          ])
        ],
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Market App",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26)),
      ),
      drawer: _drawer(),
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
