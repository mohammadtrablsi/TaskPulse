class UnPlacedHomePageItemsModale {
  int? id;
  int? userId;
  String? latitude;
  String? longitude;
  String? name;
  String? description;
  String? date;
  String? startTime;
  String? endTime;
  int? restCapacity;
  User? user;
  Ticket? ticket;
  Capacity? capacity;
  List<Photos>? photos;

  UnPlacedHomePageItemsModale(
      {this.id,
        this.userId,
        this.latitude,
        this.longitude,
        this.name,
        this.description,
        this.date,
        this.startTime,
        this.endTime,
        this.restCapacity,
        this.user,
        this.ticket,
        this.capacity,
        this.photos});

  UnPlacedHomePageItemsModale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    description = json['description'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    restCapacity = json['rest_capacity'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    ticket =
    json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
    capacity = json['capacity'] != null
        ? new Capacity.fromJson(json['capacity'])
        : null;
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['description'] = this.description;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['rest_capacity'] = this.restCapacity;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.ticket != null) {
      data['ticket'] = this.ticket!.toJson();
    }
    if (this.capacity != null) {
      data['capacity'] = this.capacity!.toJson();
    }
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
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

class Ticket {
  int? id;
  int? price;

  Ticket({this.id, this.price});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    return data;
  }
}

class Capacity {
  int? id;
  int? capacity;

  Capacity({this.id, this.capacity});

  Capacity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['capacity'] = this.capacity;
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