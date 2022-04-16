import 'dart:io';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/Artesania_Provider.dart';
import 'Providers/Gastronomia_Provider.dart';
import 'Screens/login.dart';
import 'Themes/app_theme.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HandcraftRoute',
      
     home: const loginScreen(),
     theme: AppTheme.DarkTheme
    );
  }
}
void main() => runApp(const AppState());

class MyHttpOverrides extends HttpOverrides {
  @override
  // ignore: override_on_non_overriding_member
  HttpClient createHttpclient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (cert, host, port) => true;
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

//Consumos
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MultiProvider( 
    providers: [
      
      ChangeNotifierProvider(
        create: (context) => Artesania_Provider(), 
        lazy: false,),
         
      ChangeNotifierProvider(
        create: (context) => Gastronomia_Provider(), 
        lazy: false,),
       
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HandcraftRoute',
      theme:AppTheme.DarkTheme,  
     home: const loginScreen(),
    ));
  }
}