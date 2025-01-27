import 'package:flutter/material.dart';
import 'package:store_app_1/apis/category_api.dart';

import '../models/category.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final String title = "MarketApp";

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Categories',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700])),
            TextButton(
              child: Text('See more',
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
              onPressed: () {},
            ),
          ]),
        ),
        FutureBuilder<Object>(
            future: categories,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(80),
                    child: CircularProgressIndicator(),
                  ),
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
                  children: List<Widget>.generate(5, (int index) {
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
                                padding: EdgeInsets.only(left: 20, bottom: 20),
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
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            color: Colors.grey[400],
            height: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('On Sale',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700])),
            TextButton(
              child: Text('See more',
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
              onPressed: () {},
            ),
          ]),
        ),
        FutureBuilder<Object>(
            future: categories,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(80),
                    child: CircularProgressIndicator(),
                  ),
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
              return SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 250,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ), // Aplica o borderRadius apenas no topo
                                child: Image.network(
                                  categories[index].image,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${categories[index].name}',
                                      style: TextStyle(fontSize: 20),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        Text('\$99.99',
                                            style: TextStyle(
                                                fontSize: 16,
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                        SizedBox(width: 10),
                                        Text('\$99.99',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red)),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: FilledButton(
                                        child: Text('Add to Cart'),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ));
            }),
      ],
    );
  }
}
