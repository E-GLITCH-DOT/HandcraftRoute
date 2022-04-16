
// ignore_for_file: file_names

import 'dart:convert';

Artesano artesanoFromJson(String str) => Artesano.fromJson(json.decode(str));

String artesanoToJson(Artesano data) => json.encode(data.toJson());

class Artesano {
    Artesano({
        this.idArtesano,
        this.nombre,
        this.apellidos,
        this.nombreNegocio,
        this.municipio,
        this.email,
        this.telefono,
        this.direccion,
        this.producto,
        this.cantidadProducto,
        required this.precio,
        this.material,
    });

    int?idArtesano;
    String? nombre;
    String? apellidos;
    String? nombreNegocio;
    String? municipio;
    String? email;
    String? telefono;
    String?direccion;
    String? producto;
    String? cantidadProducto;
    int precio;
    String? material;

    factory Artesano.fromJson(Map<String, dynamic> json) => Artesano(
        idArtesano: json["idArtesano"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        nombreNegocio: json["nombreNegocio"],
        municipio: json["municipio"],
        email: json["email"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        producto: json["producto"],
        cantidadProducto: json["cantidadProducto"],
        precio: json["precio"],
        material: json["material"],
    );

    Map<String, dynamic> toJson() => {
        "idArtesano": idArtesano,
        "nombre": nombre,
        "apellidos": apellidos,
        "nombreNegocio": nombreNegocio,
        "municipio": municipio,
        "email": email,
        "telefono": telefono,
        "direccion": direccion,
        "producto": producto,
        "cantidadProducto": cantidadProducto,
        "precio": precio,
        "material": material,
    };
}
