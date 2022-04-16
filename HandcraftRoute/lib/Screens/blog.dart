// ignore_for_file: camel_case_types, duplicate_ignore, use_key_in_widget_constructors, unused_import

import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:handcrafroute/Models/Artesano.dart';
import 'package:handcrafroute/Screens/Artesanos.dart';
import 'package:handcrafroute/Screens/Informacion_Artesanos.dart';
import 'package:handcrafroute/Screens/Informacion_Gastronomia.dart';


// ignore: camel_case_types

// ignore: camel_case_typesvoid main(){


class blog extends StatefulWidget {
  @override
  State<blog> createState() => _BlogState();
  
}


class _BlogState extends State<blog> {
  
  final navigationkey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final  screens = [
    const informacion_Artesanos(),
    const informacion_gastronomia(),
    //const torneo(),
    //const informaciontorneo(),
  ];
  @override
  Widget build(BuildContext context) {
   
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(
        Icons.food_bank_outlined,
        size: 30,
      ),
    ];
     
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
          focusColor: Colors.cyan,
        ),
        child: CurvedNavigationBar(
          key: navigationkey,
      color: const Color.fromARGB(255, 52, 129, 173),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.blue,
          height: 60,
          animationCurve: Curves.easeInOutCubicEmphasized,
          animationDuration: const Duration(milliseconds: 200),
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
