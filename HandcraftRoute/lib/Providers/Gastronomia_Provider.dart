// ignore_for_file: unused_import, file_names, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:handcrafroute/Models/Artesano.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import '../Models/Gastronomia.dart';
import '../Models/Lista_Respuesta.dart';
import '../Models/Respuesta.dart';

// ignore: camel_case_types
class Gastronomia_Provider extends ChangeNotifier {
  final String _host = 'handcraftrouteapi.somee.com';

  Lista_Respuesta request = Lista_Respuesta();
   

  Gastronomia_Provider() {
    getStudents();
  }

  getStudents() async {
    const String endPoint = "Api/Gastronomia";

    final url = Uri.http(_host, endPoint);

    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);

      notifyListeners();

      print(response);
      request = decodelist(json.decode(response));
    } finally {
      client.close();
    }
  }

  Future<Respuesta> post(Gastronomia gastronomia) async {
    const String endPoint = 'Api/Gastronomia';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: gastronomiaToJson(gastronomia));
      print(response.body);
      return decode(json.decode(response.body));
    } finally {
      client.close();
    }
  }
   decodelist(Map<String, dynamic> json) => Lista_Respuesta(
          exito: json["exito"],
          mensaje: json["mensaje"],
          data: List<Gastronomia>.from(json["data"].map((x) => Gastronomia.fromJson(x))),
        );
    decode(Map<String, dynamic> json) => Respuesta(
          exito: json["exito"],
          mensaje: json["mensaje"],
          data:json["data"]
        );

    Map<String, dynamic> encode(Lista_Respuesta object) => {
          "exito": object.exito,
          "mensaje": object.mensaje,
          "data": object.data?.map((x) => x.toJson())
        };
}
