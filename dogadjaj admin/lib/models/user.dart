class User {
  late int id;
  late String imePrezime;
  late String korisnickoIme;
  late String email;
  String? sifra;
  String? sifraPotvrda;

  User({
    required this.id,
    required this.imePrezime,
    required this.korisnickoIme,
    required this.email,
    this.sifra,
    this.sifraPotvrda,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['userId'] as int;
    imePrezime = json['imePrezime'] as String;
    korisnickoIme = json['korisnickoIme'] as String;
    email = json['email'] as String;
    sifra = json['sifra'] as String?;
    sifraPotvrda = json['sifraPotvrda'] as String?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['imePrezime'] = imePrezime;
    data['korisnickoIme'] = korisnickoIme;
    data['email'] = email;
    if (sifra != null) {
      data['sifra'] = sifra;
    }
    if (sifraPotvrda != null) {
      data['sifraPotvrda'] = sifraPotvrda;
    }
    return data;
  }
}
