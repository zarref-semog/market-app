import 'package:flutter/material.dart';
import 'package:store_app_1/apis/category_api.dart';

import '../models/category.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final String title = "Home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var categories;

  @override
  void initState() {
    super.initState();
    categories = CategoryApi.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700])),
                  Text('See more',
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary)),
                ]),
          ),
          FutureBuilder<Object>(
              future: categories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Failed to load categories: ${snapshot.error}'),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No categories available'),
                  );
                }
                List<Category> categories = snapshot.data as List<Category>;
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: CarouselView(
                    itemExtent: 250,
                    shrinkExtent: 0,
                    children:
                        List<Widget>.generate(categories.length, (int index) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.grey[800]),
                            child: Opacity(
                              opacity: 0.8,
                              child: Image.network(categories[index].image,
                                  fit: BoxFit.cover, height: 250),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 20),
                                  child: Text('${categories[index].name}',
                                      softWrap: false,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black54,
                                                offset: Offset(2, 2),
                                                blurRadius: 5)
                                          ],
                                          fontSize: 24)))),
                        ],
                      );
                    }),
                  ),
                );
              }),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              color: Colors.grey[400],
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('On Sale',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700])),
                  Text('See more',
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary)),
                ]),
          ),
          FutureBuilder<Object>(
              future: categories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Failed to load categories: ${snapshot.error}'),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No categories available'),
                  );
                }
                List<Category> categories = snapshot.data as List<Category>;
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: CarouselView(
                    itemExtent: 250,
                    shrinkExtent: 0,
                    children:
                        List<Widget>.generate(categories.length, (int index) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.grey[800]),
                            child: Opacity(
                              opacity: 0.8,
                              child: Image.network(categories[index].image,
                                  fit: BoxFit.cover, height: 250),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 20),
                                  child: Text('${categories[index].name}',
                                      softWrap: false,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black54,
                                                offset: Offset(2, 2),
                                                blurRadius: 5)
                                          ],
                                          fontSize: 24)))),
                        ],
                      );
                    }),
                  ),
                );
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const <BottomNavigationBarItem>[
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
        ],
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
