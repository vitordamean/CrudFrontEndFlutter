import 'package:avaliacao_3/api/acesso_api.dart';
import 'package:avaliacao_3/model/cidade.dart';
import 'package:avaliacao_3/model/cliente.dart';
import 'package:avaliacao_3/util/combo_cidade.dart';
import 'package:avaliacao_3/util/componentes.dart';
import 'package:avaliacao_3/util/radio.dart';
import 'package:flutter/material.dart';

class CadCliente extends StatefulWidget {
  const CadCliente({super.key});

  @override
  State<CadCliente> createState() => _CadClienteState();
}

class _CadClienteState extends State<CadCliente> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: 'M');
  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Cliente;
    txtNome.text = args.nome;
    txtSexo.text = args.sexo;
    txtIdade.text = args.idade.toString();
    txtCidade.text = args.cidade.nome;

    cadastrar() async {
      Cliente c = Cliente(args.id, txtNome.text, int.parse(txtIdade.text),
          txtSexo.text, Cidade(int.parse(txtCidade.text), "", ""));
      if (c.id == 0) {
        await AcessoApi().insereCliente(c.toJson());
      } else {
        await AcessoApi().alteraCliente(c.toJson());
      }
      Navigator.of(context).pushReplacementNamed('/home');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
        appBar: Componentes().criaAppBar("Cadastro de Cliente", home),
        body: Form(
          key: formController,
          child: Column(
            children: [
              Componentes().criaInputTexto(
                  TextInputType.text, "Nome", txtNome, "Informe o Nome"),
              Componentes().criaInputTexto(
                  TextInputType.text, "Idade", txtIdade, "Informe a Idade"),
              Center(child: RadioSexo(controller: txtSexo)),
              Center(child: ComboCidade(controller: txtCidade)),
              Componentes().criaBotao(formController, cadastrar, "Cadastrar"),
            ],
          ),
        ));
  }
}
