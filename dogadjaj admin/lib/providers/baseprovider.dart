import 'dart:io';

import 'package:flutter/material.dart';

//import 'package:http/io_client.dart';

abstract class BaseProvider<T> with ChangeNotifier {
  static String? _baseUrl;
  String? _endpoint;

  HttpClient client = new HttpClient();
  //IOClient? http;

  BaseProvider(String endpoint) {
    _baseUrl = const String.fromEnvironment("baseUrl",
        defaultValue: "https://10.0.2.2:7056/");
    print("baseurl: $_baseUrl");

    if (_baseUrl!.endsWith("/") == false) {
      _baseUrl = _baseUrl! + "/";
    }

    _endpoint = endpoint;
    client.badCertificateCallback = (cert, host, port) => true;
//    http = IOClient(client);
  }
}
