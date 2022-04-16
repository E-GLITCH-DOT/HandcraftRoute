// ignore_for_file: file_names

import 'dart:convert';

Gastronomia gastronomiaFromJson(String str) => Gastronomia.fromJson(json.decode(str));
String gastronomiaToJson(Gastronomia data) => json.encode(data.toJson());

class Gastronomia {
    Gastronomia({
        this.idPlatillo,
        this.nombrePlatillo,
       required this.precio,
        this.direccionEstablecimiento,
        this.telefono,
        this.nombreEstablecimiento,
    });

    int? idPlatillo;
    String? nombrePlatillo;
    int precio;
    String? direccionEstablecimiento;
    String? telefono;
    String? nombreEstablecimiento;

    factory Gastronomia.fromJson(Map<String, dynamic> json) => Gastronomia(
        idPlatillo: json["idPlatillo"],
        nombrePlatillo: json["nombrePlatillo"],
        precio: json["precio"],
        direccionEstablecimiento: json["direccionEstablecimiento"],
        telefono: json["telefono"],
        nombreEstablecimiento: json["nombreEstablecimiento"],
    );

    Map<String, dynamic> toJson() => {
        "idPlatillo": idPlatillo,
        "nombrePlatillo": nombrePlatillo,
        "precio": precio,
        "direccionEstablecimiento": direccionEstablecimiento,
        "telefono": telefono,
        "nombreEstablecimiento": nombreEstablecimiento,
    };
}
