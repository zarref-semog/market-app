import 'package:flutter/material.dart';
import 'package:store_app_1/apis/category_api.dart';
import 'package:store_app_1/models/category.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  var categories;

  @override
  void initState() {
    super.initState();
    categories = CategoryApi.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories",
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
              future: categories,
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
                          return Container(
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 150,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(categories[index].image,
                                      fit: BoxFit.cover,
                                      width: double.infinity),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text("${categories[index].name}",
                                      style: TextStyle(
                                          fontSize: 24,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black,
                                                offset: Offset(2, 2),
                                                blurRadius: 1)
                                          ],
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              ],
                            ),
                          );
                        }));
              })
        ],
      ),
    );
  }
}
