
class Register {
  late int? id;
  late String imePrezime;
  late String korisnickoIme;
  late String email;
  late String sifra;
  late String sifraPotvrda;

  Register({
     this.id,
    required this.imePrezime,
    required this.korisnickoIme,
    required this.email,
    required this.sifra,
    required this.sifraPotvrda,
  });

  Register.fromJson(Map<String, dynamic> json) {
  id = json['userId'] as int; 
  imePrezime = json['imePrezime'] as String;
  korisnickoIme = json['korisnickoIme'] as String;
  email = json['email'] as String;
  sifra = json['sifra'] as String;
  sifraPotvrda = json['sifraPotvrda'] as String;
}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['imePrezime'] = imePrezime;
    data['korisnickoIme'] = korisnickoIme;
    data['email'] = email;
    data['sifra'] = sifra;
    data['sifraPotvrda'] = sifraPotvrda;
    return data;
  }
}
