import 'dart:convert';

import 'package:dogadjaj_ba/models/ticket.dart';
import 'package:dogadjaj_ba/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class TicketProvider extends BaseProvider<Ticket> {
  TicketProvider(): super("Ticket");

  @override
  Ticket fromJson(data) {
    // TODO: implement fromJson
    return Ticket.fromJson(data);
  }


}