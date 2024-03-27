class AccoutUser {
  AccoutUser({
    required this.image,
    required this.name,
    required this.id,
    required this.email,
  });
  late String image;
  late String name;
  late String id;
  late String email;

  AccoutUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    id = json['id'] ?? '';

    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['id'] = id;

    data['email'] = email;

    return data;
  }
}
