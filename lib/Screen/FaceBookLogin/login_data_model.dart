class LoginDataModel {
  LoginDataModel({
    this.name,
    this.email,
    this.picture,
    this.id,
  });

  LoginDataModel.fromJson(dynamic json) {
    name = json['name'].toString();
    email = json['email'];
    picture = json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    id = json['id'];
  }
  String? name;
  String? email;
  Picture? picture;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name.toString();
    map['email'] = email;
    if (picture != null) {
      map['picture'] = picture?.toJson();
    }
    map['id'] = id;
    return map;
  }
}

class Picture {
  Picture({
    this.data,
  });

  Picture.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.height,
    this.isSilhouette,
    this.url,
    this.width,
  });

  Data.fromJson(dynamic json) {
    height = json['height'];
    isSilhouette = json['is_silhouette'];
    url = json['url'];
    width = json['width'];
  }
  int? height;
  bool? isSilhouette;
  String? url;
  int? width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['is_silhouette'] = isSilhouette;
    map['url'] = url;
    map['width'] = width;
    return map;
  }
}
