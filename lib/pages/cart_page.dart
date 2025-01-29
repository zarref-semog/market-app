import 'package:flutter/material.dart';
import 'package:store_app_1/apis/category_api.dart';
import 'package:store_app_1/models/category.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var items;

  @override
  void initState() {
    super.initState();
    items = CategoryApi.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.remove_shopping_cart, size: 30),
            onPressed: () {},
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Market App",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26)),
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My Cart",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700])),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                ),
                SizedBox(height: 10),
                Text("Results",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]))
              ]),
        ),
        FutureBuilder<List<Category>>(
            future: items,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Text(
                  "Failed to load categories. ${snapshot.error}",
                  textAlign: TextAlign.center,
                );
              }

              if (!snapshot.hasData) {
                return Text(
                  "No categories available. ${snapshot.error}",
                  textAlign: TextAlign.center,
                );
              }

              List<Category> items = snapshot.data!;

              return Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: SizedBox(
                          child: Image.network(items[index].image,
                              fit: BoxFit.cover, width: 100, height: 80),
                        ),
                        title: Text(
                          '${items[index].name}',
                          style: TextStyle(
                              fontSize: 18, overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                        subtitle:
                            Text("\$99.99", style: TextStyle(fontSize: 16)),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  child: Container(
                                    child: Icon(Icons.add, color: Colors.white),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle),
                                  ),
                                  onTap: () {}),
                              Text("${99}", style: TextStyle(fontSize: 16)),
                              GestureDetector(
                                  child: Container(
                                    child:
                                        Icon(Icons.remove, color: Colors.white),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                  onTap: () {}),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            })
      ],
    );
  }
}
