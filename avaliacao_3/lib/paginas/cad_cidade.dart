import 'package:avaliacao_3/api/acesso_api.dart';
import 'package:avaliacao_3/model/cidade.dart';
import 'package:avaliacao_3/util/componentes.dart';
import 'package:flutter/material.dart';

class CadCidade extends StatefulWidget {
  const CadCidade({super.key});

  @override
  State<CadCidade> createState() => _CadCidadeState();
}

class _CadCidadeState extends State<CadCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtUf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Cidade;
    txtNome.text = args.nome;
    txtUf.text = args.uf;

    salvar() async {
      Cidade c = Cidade(args.id, txtNome.text, txtUf.text);
      if (c.id == 0) {
        await AcessoApi().insereCidade(c.toJson());
      } else {
        await AcessoApi().alteraCidade(c.toJson());
      }
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes()
                .criaInputTexto(TextInputType.text, "Nome", txtNome, "Nome"),
            Componentes().criaInputTexto(TextInputType.text, "UF", txtUf, "UF"),
            Componentes().criaBotao(formController, salvar, "Salvar")
          ],
        ),
      ),
    );
  }
}
