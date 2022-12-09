import 'package:flutter/material.dart';

class Componentes {
  criaAppBar(texto, acao) {
    return AppBar(
      title: criaTexto(texto, 30),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: acao,
        )
      ],
    );
  }

  criaTexto(conteudo, tamanho) {
    return Text(
      conteudo,
      style: TextStyle(
        fontSize: tamanho,
      ),
    );
  }

  criaInputTexto(tipoTeclado, textoEtiqueta, controlador, msgValidacao) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
            labelText: textoEtiqueta,
            labelStyle: const TextStyle(
              fontSize: 20,
            )),
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 20),
        controller: controlador,
        validator: (value) {
          if (value!.isEmpty) {
            return msgValidacao;
          }
        },
      ),
    );
  }

  criaBotao(GlobalKey<FormState> controladorFormulario, funcao, titulo) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                if (controladorFormulario.currentState!.validate()) {
                  funcao();
                }
              },
              child: Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  criaTextField(titulo, senha, tipoTeclado, controlador) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextField(
        controller: controlador,
        keyboardType: tipoTeclado,
        obscureText: senha,
        decoration: InputDecoration(
          labelText: titulo,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  criaTextField2(titulo, senha, tipoTeclado, controlador) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextField(
        controller: controlador,
        keyboardType: tipoTeclado,
        obscureText: senha,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: titulo,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  criaBotao2(rotulo, funcao, altura, largura) {
    return SizedBox(
      height: altura,
      width: largura,
      child: ElevatedButton(
        onPressed: funcao,
        child: criaTexto(rotulo, 20),
      ),
    );
  }

  criaAppBar2(titulo, tam, cor, corFundo) {
    return AppBar(
      title: criaTexto2(
        titulo,
        tam,
        cor,
      ),
      centerTitle: true,
      backgroundColor: corFundo,
    );
  }

  criaTexto2(conteudo, tam, cor) {
    return Text(
      conteudo,
      style: TextStyle(
        fontSize: tam,
        color: cor,
      ),
    );
  }
}
