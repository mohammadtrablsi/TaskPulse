class MyEventsModale {
  int? id;
  int? sectionId;
  int? userId;
  String? name;
  String? description;
  int? capacity;
  String? date;
  String? startTime;
  int? period;
  String? privacy;
  String? status;
  List<Photos>? photos;
  Pivot? pivot;
  Ticket? ticket;

  MyEventsModale(
      {this.id,
        this.sectionId,
        this.userId,
        this.name,
        this.description,
        this.capacity,
        this.date,
        this.startTime,
        this.period,
        this.privacy,
        this.status,
        this.photos,
        this.pivot,
        this.ticket});

  MyEventsModale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    capacity = json['capacity'];
    date = json['date'];
    startTime = json['start_time'];
    period = json['period'];
    privacy = json['privacy'];
    status = json['status'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    ticket =
    json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['section_id'] = this.sectionId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['capacity'] = this.capacity;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['period'] = this.period;
    data['privacy'] = this.privacy;
    data['status'] = this.status;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.ticket != null) {
      data['ticket'] = this.ticket!.toJson();
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

class Pivot {
  int? id;
  Level? level;

  Pivot({this.id, this.level});

  Pivot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    return data;
  }
}

class Level {
  int? id;
  String? level;
  int? price;

  Level({this.id, this.level, this.price});

  Level.fromJson(Map<String, dynamic> json) {
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