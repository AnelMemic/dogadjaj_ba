
class User {
  late int id;
  late String imePrezime;
  late String korisnickoIme;
  late String email;

  User({
    required this.id,
    required this.imePrezime,
    required this.korisnickoIme,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
  id = json['userId'] as int; 
  imePrezime = json['imePrezime'] as String;
  korisnickoIme = json['korisnickoIme'] as String;
  email = json['email'] as String;
}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['imePrezime'] = imePrezime;
    data['korisnickoIme'] = korisnickoIme;
    data['email'] = email;
    return data;
  }
}
