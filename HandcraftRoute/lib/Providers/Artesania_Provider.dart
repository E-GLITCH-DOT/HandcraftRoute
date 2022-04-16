// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:handcrafroute/Models/Artesano.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import '../Models/Lista_Respuesta.dart';
import '../Models/Respuesta.dart';

class Artesania_Provider extends ChangeNotifier {
  final String _host = 'handcraftrouteapi.somee.com';

  Lista_Respuesta request = Lista_Respuesta();
   

  Artesania_Provider() {
    getStudents();
  }

  getStudents() async {
    const String endPoint = 'Api/Artesano';

    final url = Uri.http(_host, endPoint);

    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);

      notifyListeners();

      // ignore: avoid_print
      print(response);
      request = decodelist(json.decode(response));
    } finally {
      client.close();
    }
  }

  Future<Respuesta> post(Artesano artesano) async {
    const String endPoint = 'Api/Artesano';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: artesanoToJson(artesano));
      // ignore: avoid_print
      print(response.body);
      return decode(json.decode(response.body));
    } finally {
      client.close();
    }
  }
   decodelist(Map<String, dynamic> json) => Lista_Respuesta(
          exito: json["exito"],
          mensaje: json["mensaje"],
          data: List<Artesano>.from(json["data"].map((x) => Artesano.fromJson(x))),
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
