// ignore_for_file: camel_case_types, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:handcrafroute/Models/Artesano.dart';
import 'package:handcrafroute/Models/Lista_Respuesta.dart';
import 'package:handcrafroute/Providers/Artesania_Provider.dart';
import 'package:handcrafroute/Screens/Gastronomia.dart';
import 'package:provider/provider.dart';

import '../Providers/Gastronomia_Provider.dart';
import 'Artesanos.dart';

class informacion_gastronomia extends StatelessWidget {
  const informacion_gastronomia({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final gastronomiaProvider = Provider.of<Gastronomia_Provider>(context);

    final Lista_Respuesta gastronomia = gastronomiaProvider.request;

    return Scaffold(
      //APP BA   
      appBar: AppBar(
        title: const Text('Gastronomia',style: TextStyle(
                              color: Colors.white,
                                fontSize: 20, fontFamily: 'Raleway'),),
        
       automaticallyImplyLeading: false,

      ),
      //GRIDVIEW
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: <Widget>[
              ...?gastronomia.data?.map(
                (gastronomia) =>
                    //CARDS
                    Center(
                        child: Card(
                          color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(15),
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: (() {}),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.people,color: Colors.black,),
                          title: Text(
                            'Nombre del platillo: ${gastronomia.nombrePlatillo}',
                            style: const TextStyle(
                              color: Colors.black,
                                fontSize: 20, fontFamily: 'Raleway'),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            const Center(
                              child: Text('',
                                  style: TextStyle(
                                    color: Colors.black,
                                    backgroundColor:
                                        Colors.white,
                                    fontSize: 20,
                                  )),
                            ),
                            Ink.image(
                              image: const AssetImage('assets/tacos.jpg'),
                              height: 200,
                              fit: BoxFit.fitWidth,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                               Text(
                                'Nombre del negocio: ${gastronomia.nombreEstablecimiento}',style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),
                              ),
                               Text(
                                'Direccion del establecimiento: ${gastronomia.direccionEstablecimiento}',style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),
                              ),
                              Text(
                                'Precio del platillo: ${gastronomia.precio}',style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),
                              ),
                              Text(
                                  'Telefono de contacto : ${gastronomia.telefono}',style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),)
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextButton.icon(
                                icon: const Icon(Icons.visibility,
                                    size: 20.0,
                                    color: Colors.black),
                                label: const Text(
                                  'Visitar',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),
                                ),
                                onPressed: () {
                                  ('Confirmación');
                                },
                              ),
                              TextButton.icon(
                                icon: const Icon(Icons.edit,
                                    size: 20.0,
                                    color:Colors.black),
                                label: const Text(
                                  'Editar',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),
                                ),
                                onPressed: () {
                                  ('Confirmación');
                                },
                              ),
                              TextButton.icon(
                                icon: const Icon(Icons.delete_forever,
                                    size: 20.0,
                                    color: Color.fromARGB(255, 240, 68, 68)),
                                label: const Text(
                                  'Elimar',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),
                                ),
                                onPressed: () {
                                  ('Elimanr');
                                },
                              ),
                            ]),
                      ],
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:  FloatingActionButton(
          child:
           const Icon(Icons.add),
          //Navegación
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const gasronomia_add()));
          },
          backgroundColor: Colors.blue,
        ),
          
  
    );
  }
}
