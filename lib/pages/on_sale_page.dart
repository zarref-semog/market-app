import 'package:flutter/material.dart';
import 'package:store_app_1/apis/category_api.dart';
import 'package:store_app_1/models/category.dart';

class OnSalePage extends StatefulWidget {
  @override
  State<OnSalePage> createState() => _OnSalePageState();
}

class _OnSalePageState extends State<OnSalePage> {
  var products;

  @override
  void initState() {
    super.initState();
    products = CategoryApi.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("On Sale",
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
                  color: Colors.grey[700])),
          FutureBuilder<List<Category>>(
              future: products,
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

                List<Category> categories = snapshot.data!;

                return Expanded(
                    child: ListView.builder(
                        itemCount: categories.length,
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${categories[index].name}',
                                          style: TextStyle(fontSize: 20),
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
                                            style: ButtonStyle(
                                                shape: WidgetStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.shopping_cart, size: 24),
                                                SizedBox(width: 10),
                                                Text('Add to Cart', style: TextStyle(fontSize: 18)),
                                              ],
                                            ),
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
                        }));
              })
        ],
      ),
    );
  }
}
