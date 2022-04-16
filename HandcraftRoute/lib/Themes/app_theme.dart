import 'package:flutter/material.dart';


class AppTheme{

  static const double globalElevation = 0;
  

   /* static final ThemeData LightTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 241, 0, 0),
      
      
      elevation: globalElevation
      ),
      scaffoldBackgroundColor: Colors.white,
    
      //appbar
      
    );*/
    // ignore: non_constant_identifier_names
    static final DarkTheme = ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 52, 144, 187),
      centerTitle: true,
      elevation: globalElevation),
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),

      inputDecorationTheme: const InputDecorationTheme(
      focusColor: Colors.white,
      
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 42, 61, 63),
          ),
        ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 19, 105, 204),
            width: 2.0,
          ),
        ),
      ),
      );
    
}