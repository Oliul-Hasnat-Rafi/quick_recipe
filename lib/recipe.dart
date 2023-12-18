import 'package:flutter/material.dart';
import 'package:quick_recipe/model/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class recipe extends StatefulWidget {
  final String recipe_id, Meal_name, Meal_thu;
  recipe(
      {Key? key,
      required this.recipe_id,
      required this.Meal_name,
      required this.Meal_thu})
      : super(key: key);

  @override
  State<recipe> createState() => _recipeState();
}

class _recipeState extends State<recipe> {
  late final String meals_url;
  @override
  void initState() {
    super.initState();
    meals_url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" +
        widget.recipe_id;
  }

  Future<recipe_model> getallrecipe() async {
    final response = await http.get(Uri.parse(meals_url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return recipe_model.fromJson(data);
    } else {
      return recipe_model.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.Meal_name),
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              children: [
                Container(
                  height: 200,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.Meal_thu),
                        fit: BoxFit.fill,
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: FutureBuilder(
                    future: getallrecipe(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text('Loading...'));
                      } else {
                        return Container(
                          height: 90,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.meals!.length,
                            itemBuilder: (context, index) {
                              final meal = snapshot.data!.meals![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      color: const Color.fromARGB(
                                          255, 173, 196, 206),
                                      child: Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ingredient: " +
                                                  meal.strIngredient1
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              "Quantity: " +
                                                  meal.strMeasure1.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: const Color.fromARGB(
                                          255, 173, 196, 206),
                                      child: Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ingredient: " +
                                                  meal.strIngredient2
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              "Quantity: " +
                                                  meal.strMeasure2.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: const Color.fromARGB(
                                          255, 173, 196, 206),
                                      child: Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ingredient: " +
                                                  meal.strIngredient3
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              "Quantity: " +
                                                  meal.strMeasure3.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: const Color.fromARGB(
                                          255, 173, 196, 206),
                                      child: Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ingredient: " +
                                                  meal.strIngredient4
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              "Quantity: " +
                                                  meal.strMeasure4.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: const Color.fromARGB(
                                          255, 173, 196, 206),
                                      child: Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ingredient: " +
                                                  meal.strIngredient5
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              "Quantity: " +
                                                  meal.strMeasure5.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: const Color.fromARGB(
                                          255, 173, 196, 206),
                                      child: Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ingredient: " +
                                                  meal.strIngredient6
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              "Quantity: " +
                                                  meal.strMeasure6.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: const Color.fromARGB(
                                          255, 173, 196, 206),
                                      child: Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ingredient: " +
                                                  meal.strIngredient7
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              "Quantity: " +
                                                  meal.strMeasure7.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: const Color.fromARGB(
                                          255, 173, 196, 206),
                                      child: Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ingredient: " +
                                                  meal.strIngredient8
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              "Quantity: " +
                                                  meal.strMeasure8.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: FutureBuilder(
                      future: getallrecipe(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: Text('Loading...'));
                        } else {
                          return ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    color: const Color.fromARGB(
                                        255, 150, 182, 197),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          snapshot.data!.meals![index]
                                              .strInstructions
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      }),
                )
              ],
            )));
  }
}
