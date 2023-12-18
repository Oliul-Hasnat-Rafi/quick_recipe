import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quick_recipe/categories_item.dart';
import 'package:quick_recipe/model/categories_model.dart';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  const Categories({Key? key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final String apiUrl =
      "https://www.themealdb.com/api/json/v1/1/categories.php";

  Future<categories_model> getCategories() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return categories_model.fromJson(data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  void _navigateToCategoryItem(String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => categories_item(Categories_name: categoryName),
      ),
    );
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Recipe'),
        backgroundColor: Color.fromARGB(255, 70, 146, 169),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: 'Search with meal name',
                suffixIcon: searchController.text.isEmpty
                    ? const Icon(Icons.search)
                    : GestureDetector(
                        onTap: () {
                          searchController.text = "";
                          setState(() {});
                        },
                        child: Icon(Icons.clear)),
              ),
              onChanged: (value) {
                setState(() {
                  print(searchController);
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No data available'));
                } else {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.data!.categories!.length,
                    itemBuilder: (context, index) {
                      var category = snapshot.data!.categories![index];
                      if (searchController.text.isEmpty) {
                        return GestureDetector(
                          onTap: () {
                            _navigateToCategoryItem(
                                category.strCategory.toString());
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: const Color.fromARGB(255, 70, 130, 169),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  category.strCategoryThumb.toString(),
                                  height: 150,
                                  width: 150,
                                ),
                                Text(
                                  category.strCategory.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (category.strCategory!
                          .toLowerCase()
                          .startsWith(searchController.text.toLowerCase())) {
                        return GestureDetector(
                          onTap: () {
                            _navigateToCategoryItem(
                                category.strCategory.toString());
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: const Color.fromARGB(255, 70, 130, 169),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  category.strCategoryThumb.toString(),
                                  height: 150,
                                  width: 150,
                                ),
                                Text(
                                  category.strCategory.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
