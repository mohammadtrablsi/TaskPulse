class AllSectionOfVenueModale {
  int? id;
  int? venueId;
  String? description;
  int? capacity;
  int? price;
  List<Photos>? photos;
  List<CategoriesPivot>? categoriesPivot;

  AllSectionOfVenueModale(
      {this.id,
        this.venueId,
        this.description,
        this.capacity,
        this.price,
        this.photos,
        this.categoriesPivot});

  AllSectionOfVenueModale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    description = json['description'];
    capacity = json['capacity'];
    price = json['price'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    if (json['categories_pivot'] != null) {
      categoriesPivot = <CategoriesPivot>[];
      json['categories_pivot'].forEach((v) {
        categoriesPivot!.add(new CategoriesPivot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venue_id'] = this.venueId;
    data['description'] = this.description;
    data['capacity'] = this.capacity;
    data['price'] = this.price;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    if (this.categoriesPivot != null) {
      data['categories_pivot'] =
          this.categoriesPivot!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  int? id;
  String? path;

  Photos({this.id, this.path});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}

class CategoriesPivot {
  int? id;
  Category? category;
  List<Levels>? levels;

  CategoriesPivot({this.id, this.category, this.levels});

  CategoriesPivot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(new Levels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.levels != null) {
      data['levels'] = this.levels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Levels {
  int? id;
  String? level;
  int? price;

  Levels({this.id, this.level, this.price});

  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    data['price'] = this.price;
    return data;
  }
}