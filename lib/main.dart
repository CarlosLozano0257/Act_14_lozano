import 'package:flutter/material.dart';
import 'mispantallas/miscompras.dart';
import 'mispantallas/detallecompra.dart';
import 'mispantallas/buscar.dart';
import 'mispantallas/favoritos.dart';
import 'mispantallas/perfil.dart';
import 'mispantallas/cerrarsesion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameShop',
      initialRoute: '/miscompras',
      routes: {
        '/miscompras': (context) => const MisCompras(),
        '/detallecompra': (context) => const DetalleCompra(),
        '/buscar': (context) => const Buscar(),
        '/favoritos': (context) => const Favoritos(),
        '/perfil': (context) => const Perfil(),
        '/cerrarsesion': (context) => const CerrarSesion(),
      },
    );
  }
}