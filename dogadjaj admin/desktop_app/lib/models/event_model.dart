class Event {
  final String naziv;
  final String datum;
  final String kategorija;
  final String podkategorija;
  final String lokacija;
  final String slika;

  Event({
    required this.naziv,
    required this.datum,
    required this.kategorija,
    required this.podkategorija,
    required this.lokacija,
    required this.slika,
  });
}

final List<Event> mockEventData = [
  Event(
    naziv: 'Sfera',
    datum: '2023-01-01',
    kategorija: 'Konferencija',
    podkategorija: 'IT',
    lokacija: 'Mostar',
    slika: 'image1.jpg',
  ),
  Event(
    naziv: 'Sfera2023',
    datum: '2023-01-01',
    kategorija: 'Sajam',
    podkategorija: 'Beauty',
    lokacija: 'Sarajrvo',
    slika: 'image1.jpg',
  ),
];
