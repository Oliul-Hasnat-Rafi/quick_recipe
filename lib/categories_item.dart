import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_recipe/model/categories_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:quick_recipe/recipe.dart';

class categories_item extends StatefulWidget {
  final String Categories_name;
  categories_item({Key? key, required this.Categories_name}) : super(key: key);

  @override
  State<categories_item> createState() => _categories_itemState();
}

class _categories_itemState extends State<categories_item> {
  late final String url;
  @override
  void initState() {
    super.initState();
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=" +
        widget.Categories_name;
  }

  Future<categories_item_model> getallitem() async {
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return categories_item_model.fromJson(data);
    } else {
      return categories_item_model.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.Categories_name),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getallitem(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading...'));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.meals!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => recipe(
                                            recipe_id: snapshot
                                                .data!.meals![index].idMeal
                                                .toString(),
                                            Meal_name: snapshot
                                                .data!.meals![index].strMeal
                                                .toString(),
                                            Meal_thu: snapshot.data!
                                                .meals![index].strMealThumb
                                                .toString(),
                                          ))));
                            },
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      snapshot.data!.meals![index].strMealThumb
                                              .toString() ??
                                          'https://i.postimg.cc/RhWtHc98/download.png',
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.meals![index].strMeal
                                                .toString(),
                                            maxLines: 2,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    ));
  }
}
