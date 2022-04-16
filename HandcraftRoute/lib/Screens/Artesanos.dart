// ignore_for_file: file_names, camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:handcrafroute/Models/Artesano.dart';
import 'package:handcrafroute/Models/Lista_Respuesta.dart';
import 'package:handcrafroute/Providers/Artesania_Provider.dart';
import 'package:provider/provider.dart';

import 'blog.dart';

class artesanos_add extends StatefulWidget {
  const artesanos_add({Key? key}) : super(key: key);

  @override
  _ArtesanosState createState() => _ArtesanosState();
}

class _ArtesanosState extends State<artesanos_add> {
  final _formKey = GlobalKey<FormState>();
  final Artesano servicio1 = Artesano(
    idArtesano: 0,
    precio: 0,
  );

  List<String> items = [
    'Mérida',
    'Mocochá',
    'Motul',
    'Muna',
    'Cacalchén',
     'Chemax',
    'Chicxulub Pueblo',
    'Progreso',
    'Tinum',
    'Telchac Pueblo',
     'Telchac Puerto',
    'Temax',
    'Umán',
    'Huhí',
    'Hunucmá',
  ];
  String? dropdownvalue = 'Mérida';
  @override
  Widget build(BuildContext context) {
    final artesanoprovider =
        Provider.of<Artesania_Provider>(context);
    final Lista_Respuesta artesano = artesanoprovider.request;
    servicio1.municipio = dropdownvalue;
    final enviar = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color:const Color.fromARGB(255, 52, 144, 187),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
             artesanoprovider.post(servicio1);
                         Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => blog(),
                    ));
              
            }
          },
          // ignore: prefer_const_constructors
          child: Text(
            "Registrar Artesano",
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
            "Registrar Artesano",
          style: TextStyle(
                              color: Colors.white,
                                fontSize: 20, fontFamily: 'Raleway'),),
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
                                
                                _nombre(),
                                const SizedBox(height: 20),
                                _apellidos(),
                                const SizedBox(height: 20),
                                _nombreNegocios(),
                                const SizedBox(height: 20),
                                _crearDropDown(),
                                const SizedBox(height: 20),
                                _email(), // TextField con múltiples opciones de decoración
                                 const SizedBox(height: 20),
                                _telefono(),
                                 const SizedBox(height: 20),
                                _direccion(),
                                 const SizedBox(height: 20),
                                _producto(),
                                 const SizedBox(height: 20),
                                _cantidadproducto(),
                                 const SizedBox(height: 20),
                                   _precio(),
                                 const SizedBox(height: 20),
                                _material(),
                                const SizedBox(height: 20),
                                enviar
                              ],
                            )))))));
  }





  Widget _nombre() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.nombre,
        onChanged: (value) => servicio1.nombre = value,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 20) {
            return ("No  puede escribir mas de  20 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.emoji_people_rounded,
            color: Colors.black,
          ),
          hintText: "Eduardo",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
    Widget _apellidos() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.apellidos,
        onChanged: (value) => servicio1.apellidos = value,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 20) {
            return ("No  puede escribir mas de  20 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.people,
            color: Colors.black,
          ),
          hintText: "Hererra",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
  Widget _nombreNegocios() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.nombreNegocio,
        onChanged: (value) => servicio1.nombreNegocio = value,
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
          hintText: "Herreramaster",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
  Widget _email() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.email,
        onChanged: (value) => servicio1.email = value,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor introduzca su correo electrónico");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Por favor introduzca una dirección de correo electrónico válida");
          }
          if (value.length > 40) {
            return ("No  puede escribir mas de  40 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.black,
          ),
          hintText: "emanueldevelopermaaster@gmail.com",
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
        initialValue: servicio1.direccion,
        onChanged: (value) => servicio1.direccion = value,
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
          hintText: "Calle 30 x 137 y 139",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
 Widget _producto() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.producto,
        onChanged: (value) => servicio1.producto = value,
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
            Icons.shopify,
            color: Colors.black,
          ),
          hintText: "Harrones de barro",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
   Widget _cantidadproducto() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.cantidadProducto,
        onChanged: (value) => servicio1.cantidadProducto = value,
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
          hintText: "Cantidad del prodcuto",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
   Widget _material() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.material,
        onChanged: (value) => servicio1.material = value,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 20) {
            return ("No  puede escribir mas de  20 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.star,
            color: Colors.black,
          ),
          hintText: "Material del producto: Barro",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
  Widget _crearDropDown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Colors.black))),
      value: dropdownvalue,
      focusColor: Colors.white,
      iconDisabledColor: Colors.black,
      iconEnabledColor: Colors.black,
      dropdownColor: Colors.white,
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items
          .map((items) => DropdownMenuItem<String>(
                value: items,
                child: Text(items,
                    style: const TextStyle(fontSize: 15, color: Colors.black)),
              ))
          .toList(),
      onChanged: (items) => setState(() => dropdownvalue = items),
    );
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
          if (n  == 0 || n == null) {
            return 'El precio  debe de ser mayor a 0';
          }
          if(n < 0 )
          {
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
          hintText: "Precio del producto",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
