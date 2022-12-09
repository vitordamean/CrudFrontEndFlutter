import 'package:avaliacao_3/api/acesso_api.dart';
import 'package:avaliacao_3/model/cidade.dart';
import 'package:avaliacao_3/util/componentes.dart';
import 'package:flutter/material.dart';

class ListaCidade extends StatefulWidget {
  const ListaCidade({super.key});

  @override
  State<ListaCidade> createState() => _ListaCidadeState();
}

class _ListaCidadeState extends State<ListaCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtUf = TextEditingController();
  List<Cidade> lista = [];
  ListaCidade() async {
    if (txtUf.text == "") {
      List<Cidade> cidade = await AcessoApi().listaTodasCidades();
      setState(() {
        lista = cidade;
      });
    } else {
      List<Cidade> cidade = await AcessoApi().listaCidadePorUf(txtUf.text);
      setState(() {
        lista = cidade;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ListaCidade();
  }

  @override
  Widget build(BuildContext context) {
    criaItemCidade(Cidade c, context) {
      return ListTile(
        title: Text('${c.id} - ${c.nome}/${c.uf}'),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/cad_cidade",
                      arguments: c,
                    );
                  }),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluiCidade(c.id);
                    setState(() {
                      ListaCidade();
                    });
                  }),
            ],
          ),
        ),
      );
    }

    irTelaCadastro() {
      Navigator.pushReplacementNamed(context, "/cad_cidade",
          arguments: Cidade(
            0,
            "",
            "",
          ));
    }

    return Scaffold(
      body: Form(
        key: formController,
        child: Column(
          children: [
            Center(
                child: Componentes().criaInputTexto(
                    TextInputType.text, "Digite a UF", txtUf, "Digite uma UF")),
            Componentes().criaBotao(formController, ListaCidade, "Pesquisar"),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, indice) {
                  return Card(
                    elevation: 6,
                    margin: const EdgeInsets.all(3),
                    child: criaItemCidade(lista[indice], context),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: irTelaCadastro,
        child: const Icon(Icons.add),
      ),
    );
  }
}
