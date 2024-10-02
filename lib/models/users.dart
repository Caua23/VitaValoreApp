class User {
  final String name;
  final String password;
  final String email;
  final String? phone;

  User({
    required this.name,
    required this.password,
    required this.email,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password, 'phone': phone};
  }
}
