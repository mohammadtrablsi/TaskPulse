class CreateEvent4Modale {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? longitude;
  String? latitude;
  List<Photos>? photos;
  List<Phones>? phones;

  CreateEvent4Modale(
      {this.id,
        this.userId,
        this.name,
        this.description,
        this.longitude,
        this.latitude,
        this.photos,
        this.phones});

  CreateEvent4Modale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(new Phones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    if (this.phones != null) {
      data['phones'] = this.phones!.map((v) => v.toJson()).toList();
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

class Phones {
  int? id;
  String? phoneNumber;

  Phones({this.id, this.phoneNumber});

  Phones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}