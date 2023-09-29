class PlacedHomePageItemsModale {
  var id;
  var userId;
  var sectionId;
  var name;
  var description;
  var capacity;
  var date;
  var startTime;
  var period;
  var restCapacity;
  User? user;
  Ticket? ticket;
  Section? section;
  List<Photos>? photos;

  PlacedHomePageItemsModale(
      {this.id,
        this.userId,
        this.sectionId,
        this.name,
        this.description,
        this.capacity,
        this.date,
        this.startTime,
        this.period,
        this.restCapacity,
        this.user,
        this.ticket,
        this.section,
        this.photos});

  PlacedHomePageItemsModale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sectionId = json['section_id'];
    name = json['name'];
    description = json['description'];
    capacity = json['capacity'];
    date = json['date'];
    startTime = json['start_time'];
    period = json['period'];
    restCapacity = json['rest_capacity'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    ticket =
    json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
    section =
    json['section'] != null ? new Section.fromJson(json['section']) : null;
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
    data['section_id'] = this.sectionId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['capacity'] = this.capacity;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['period'] = this.period;
    data['rest_capacity'] = this.restCapacity;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.ticket != null) {
      data['ticket'] = this.ticket!.toJson();
    }
    if (this.section != null) {
      data['section'] = this.section!.toJson();
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

class Section {
  int? id;
  int? venueId;
  String? description;
  int? capacity;
  int? price;
  Venue? venue;
  User? name;

  Section(
      {this.id,
        this.venueId,
        this.description,
        this.capacity,
        this.price,
        this.venue,
        this.name});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    description = json['description'];
    capacity = json['capacity'];
    price = json['price'];
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    name = json['name'] != null ? new User.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venue_id'] = this.venueId;
    data['description'] = this.description;
    data['capacity'] = this.capacity;
    data['price'] = this.price;
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    return data;
  }
}

class Venue {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? longitude;
  String? latitude;
  int? rate;
  User? owner;

  Venue(
      {this.id,
        this.userId,
        this.name,
        this.description,
        this.longitude,
        this.latitude,
        this.rate,
        this.owner});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
    owner = json['owner'] != null ? new User.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['rate'] = this.rate;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
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