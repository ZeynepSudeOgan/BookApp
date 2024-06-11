class User {
  int? id;
  String? name;
  String? surname;
  String? username;
  String? password;
  String? imageLink;
  User(
      {this.id = -1,
      this.name = "null",
      this.surname = "null",
      this.username = "username",
      this.password = "password",
      this.imageLink =
          "https://galeri.netfotograf.com/images/medium/69433C4D690F8A66.jpg"});

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      surname: json['lastname'],
      username: json['username'],
      imageLink: json['imageLink'],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastname': surname,
      'username': username,
      'password': password, // Include password if it exists
      'imageLink': imageLink,
    };
  }
}
