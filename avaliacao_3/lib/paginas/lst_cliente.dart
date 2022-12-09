import 'package:avaliacao_3/api/acesso_api.dart';
import 'package:avaliacao_3/model/cidade.dart';
import 'package:avaliacao_3/model/cliente.dart';
import 'package:avaliacao_3/util/combo_cidade.dart';
import 'package:avaliacao_3/util/componentes.dart';
import 'package:flutter/material.dart';

class ListaCliente extends StatefulWidget {
  const ListaCliente({super.key});

  @override
  State<ListaCliente> createState() => _ListaClienteState();
}

class _ListaClienteState extends State<ListaCliente> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtCidade = TextEditingController();
  List<Cliente> lista = [];
  ListaCliente() async {
    if (txtCidade.text == "") {
      List<Cliente> cliente = await AcessoApi().listaTodosClientes();
      setState(() {
        lista = cliente;
      });
    } else {
      List<Cliente> cliente =
          await AcessoApi().listaClientesPorCidade(int.parse(txtCidade.text));
      setState(() {
        lista = cliente;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ListaCliente();
  }

  @override
  Widget build(BuildContext context) {
    criaItemCliente(Cliente c, context) {
      return ListTile(
        title: Text('${c.id} - ${c.nome}'),
        subtitle: Text(
            '${c.sexo} - Idade: ${c.idade} - ${c.cidade.nome}/${c.cidade.uf}'),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/cad_cliente",
                      arguments: c,
                    );
                  }),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluiCliente(c.id);
                    setState(() {
                      ListaCliente();
                    });
                  }),
            ],
          ),
        ),
      );
    }

    irTelaCadastro() {
      Navigator.pushReplacementNamed(context, "/cad_cliente",
          arguments: Cliente(0, "", 0, "", Cidade(int.parse("0"), "", "")));
    }

    return Scaffold(
        body: Form(
            key: formController,
            child: Column(children: [
              Center(
                child: ComboCidade(
                  controller: txtCidade,
                ),
              ),
              Componentes()
                  .criaBotao(formController, ListaCliente, "Pesquisar"),
              Expanded(
                  child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, indice) {
                  return Card(
                    elevation: 6,
                    margin: const EdgeInsets.all(3),
                    child: criaItemCliente(lista[indice], context),
                  );
                },
              ))
            ])));
  }
}
