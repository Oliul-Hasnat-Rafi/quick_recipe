class categories_model {
  List<Categories>? categories;

  categories_model({this.categories});

  categories_model.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Categories(
      {this.idCategory,
      this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription});

  Categories.fromJson(dynamic json) {
    idCategory = json['idCategory'];
    strCategory = json['strCategory'];
    strCategoryThumb = json['strCategoryThumb'];
    strCategoryDescription = json['strCategoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCategory'] = this.idCategory;
    data['strCategory'] = this.strCategory;
    data['strCategoryThumb'] = this.strCategoryThumb;
    data['strCategoryDescription'] = this.strCategoryDescription;
    return data;
  }
}