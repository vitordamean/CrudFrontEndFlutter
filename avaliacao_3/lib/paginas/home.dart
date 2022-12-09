import 'package:avaliacao_3/model/cidade.dart';
import 'package:avaliacao_3/model/cliente.dart';
import 'package:avaliacao_3/util/componentes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  goToCadCidade() {
    Navigator.pushNamed(context, '/cad_cidade', arguments: Cidade(0, "", ""));
  }

  goToCadCliente() {
    Navigator.pushNamed(context, '/cad_cliente',
        arguments: Cliente(0, "", 0, "", Cidade(int.parse("0"), "", "")));
  }

  goToLstCidade() {
    Navigator.of(context).pushNamed('/lst_cidade');
  }

  goToLstCliente() {
    Navigator.of(context).pushNamed('/lst_cliente');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Componentes()
          .criaAppBar2('Central de Cadastro', 20, Colors.black, Colors.amber),
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            Componentes()
                .criaBotao2('Cadastro de Cidade', goToCadCidade, 50, 500),
            const SizedBox(height: 25),
            Componentes()
                .criaBotao2('Cadastro de Cliente', goToCadCliente, 50, 500),
            const SizedBox(height: 25),
            Componentes()
                .criaBotao2('Lista de Cidades', goToLstCidade, 50, 500),
            const SizedBox(height: 25),
            Componentes()
                .criaBotao2('Lista de Clientes', goToLstCliente, 50, 500),
            const SizedBox(height: 25),
          ])),
    );
  }
}
