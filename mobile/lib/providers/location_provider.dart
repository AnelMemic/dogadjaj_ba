import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LocationProvider with ChangeNotifier {
  final String _baseUrl = "http://10.0.2.2:7056/Lokacija";

  Future<List<Location>> getLocations() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:7056/Lokacija'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Location.fromJson(json)).toList();
      } else {
        throw Exception("Greška prilikom dohvaćanja lokacija: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Neuspjelo dohvaćanje lokacija: $e");
    }
    
  }
  
}
class Location {
  final int lokacijaId;
  final int gradId;
  final String adresa;
  final String nazivObjekta;

  Location({
    required this.lokacijaId,
    required this.gradId,
    required this.adresa,
    required this.nazivObjekta,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lokacijaId: json['lokacijaId'] ?? -1, // Ako je null, postavi na -1
      gradId: json['gradId'] ?? 0,
      adresa: json['adresa'] ?? "Nepoznato",
      nazivObjekta: json['nazivObjekta'] ?? "Nepoznato",
    );
  }

  @override
  String toString() {
    return "Location(lokacijaId: $lokacijaId, nazivObjekta: $nazivObjekta, adresa: $adresa)";
  }
}


