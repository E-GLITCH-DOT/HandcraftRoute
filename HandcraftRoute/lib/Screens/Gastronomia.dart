// ignore_for_file: file_names, camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:handcrafroute/Models/Gastronomia.dart';
import 'package:handcrafroute/Models/Lista_Respuesta.dart';
import 'package:provider/provider.dart';

import '../Providers/Gastronomia_Provider.dart';
import 'blog.dart';

class gasronomia_add extends StatefulWidget {
  const gasronomia_add({Key? key}) : super(key: key);

  @override
  _GasronomiaState createState() => _GasronomiaState();
}

class _GasronomiaState extends State<gasronomia_add> {
  final _formKey = GlobalKey<FormState>();
  final Gastronomia servicio1 = Gastronomia(
    idPlatillo: 0,
    precio: 0,
  );

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final gastronomia_Provider = Provider.of<Gastronomia_Provider>(context);
    final Lista_Respuesta gastronomia = gastronomia_Provider.request;
    final enviar = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 52, 144, 187),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              gastronomia_Provider.post(servicio1);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => blog(),
                  ));
            }
          },
          // ignore: prefer_const_constructors
          child: Text(
            "Registrar Gastronomia",
            textAlign: TextAlign.center,
            // ignore: prefer_const_constructors
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Registrar Gastronomia",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Raleway'),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromARGB(255, 52, 144, 187),
          elevation: 0,
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                    height: 180,
                                    child: Image.asset(
                                      "assets/Logo.png",
                                      fit: BoxFit.contain,
                                    )),
                                const SizedBox(height: 20),
                                _nombreplatillo(),
                                const SizedBox(height: 20),
                                _nombreNegocios(),
                                 const SizedBox(height: 20),
                                _precio(),
                                const SizedBox(height: 20),
                                _telefono(),
                                const SizedBox(height: 20),
                                _direccion(),
                               
                                const SizedBox(height: 20),
                                enviar
                              ],
                            )))))));
  }

  Widget _nombreNegocios() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.nombreEstablecimiento,
        onChanged: (value) => servicio1.nombreEstablecimiento = value,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 30) {
            return ("No  puede escribir mas de  30 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.shop_sharp,
            color: Colors.black,
          ),
          hintText: "Nombre del negocio",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
   Widget _nombreplatillo() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.nombrePlatillo,
        onChanged: (value) => servicio1.nombrePlatillo = value,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 30) {
            return ("No  puede escribir mas de  30 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.food_bank_sharp,
            color: Colors.black,
          ),
          hintText: "Nombre del platillo",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }


  Widget _telefono() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.telefono,
        onChanged: (value) => servicio1.telefono = value,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 13) {
            return ("No  puede escribir mas de  13 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.phone,
            color: Colors.black,
          ),
          hintText: "999-xxxx-xxx",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }

  Widget _direccion() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.streetAddress,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.direccionEstablecimiento,
        onChanged: (value) => servicio1.direccionEstablecimiento = value,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 50) {
            return ("No  puede escribir mas de  50 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.home,
            color: Colors.black,
          ),
          hintText: "Direccion: Calle 30 x 137 y 139",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
  Widget _precio() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.precio.toString(),
        onChanged: (value) => servicio1.precio = int.parse(value),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 20) {
            return ("No  escribir mas de veinte cifras.");
          }
          final n = num.tryParse(value);
          if (n == 0 || n == null) {
            return 'El precio  debe de ser mayor a 0';
          }
          if (n < 0) {
            return 'El precio d debe de ser mayor a 0';
          }
          // reg expression for email validation
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.attach_money,
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Precio producto",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
