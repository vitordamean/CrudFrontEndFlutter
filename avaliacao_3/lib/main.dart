import 'package:avaliacao_3/paginas/cad_cidade.dart';
import 'package:avaliacao_3/paginas/cad_cliente.dart';
import 'package:avaliacao_3/paginas/home.dart';
import 'package:avaliacao_3/paginas/lst_cidade.dart';
import 'package:avaliacao_3/paginas/lst_cliente.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Crud());
}

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();

  static fromJson(e) {}
}

class _CrudState extends State<Crud> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/cad_cidade': (context) => CadCidade(),
        '/cad_cliente': (context) => CadCliente(),
        '/lst_cidade': (context) => ListaCidade(),
        '/lst_cliente': (context) => ListaCliente(),
      },
    );
  }
}
