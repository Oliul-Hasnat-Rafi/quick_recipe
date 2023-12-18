class categories_item_model {
  List<Meals>? _meals;

  categories_item_model({List<Meals>? meals}) {
    if (meals != null) {
      this._meals = meals;
    }
  }

  List<Meals>? get meals => _meals;
  set meals(List<Meals>? meals) => _meals = meals;

  categories_item_model.fromJson(dynamic json) {
    if (json['meals'] != null) {
      _meals = <Meals>[];
      json['meals'].forEach((v) {
        _meals!.add(new Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._meals != null) {
      data['meals'] = this._meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String? _strMeal;
  String? _strMealThumb;
  String? _idMeal;

  Meals({String? strMeal, String? strMealThumb, String? idMeal}) {
    if (strMeal != null) {
      this._strMeal = strMeal;
    }
    if (strMealThumb != null) {
      this._strMealThumb = strMealThumb;
    }
    if (idMeal != null) {
      this._idMeal = idMeal;
    }
  }

  String? get strMeal => _strMeal;
  set strMeal(String? strMeal) => _strMeal = strMeal;
  String? get strMealThumb => _strMealThumb;
  set strMealThumb(String? strMealThumb) => _strMealThumb = strMealThumb;
  String? get idMeal => _idMeal;
  set idMeal(String? idMeal) => _idMeal = idMeal;

  Meals.fromJson(Map<String, dynamic> json) {
    _strMeal = json['strMeal'];
    _strMealThumb = json['strMealThumb'];
    _idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strMeal'] = this._strMeal;
    data['strMealThumb'] = this._strMealThumb;
    data['idMeal'] = this._idMeal;
    return data;
  }
}
