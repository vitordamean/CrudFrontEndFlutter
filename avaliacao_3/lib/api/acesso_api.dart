import 'dart:convert';
import 'package:avaliacao_3/model/cidade.dart';
import 'package:avaliacao_3/model/cliente.dart';
import 'package:avaliacao_3/paginas/lst_cidade.dart';
import 'package:http/http.dart';

class AcessoApi {
  Future<List<Cidade>> listaTodasCidades() async {
    String url = "http://localhost:8080/cidade";
    Response resposta = await get(Uri.parse(url));
    String jsonUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonUtf8);
    List<Cidade> listaCidades =
        List<Cidade>.from(l.map((e) => Cidade.fromJson(e)));
    return listaCidades;
  }

  Future<List<Cliente>> listaTodosClientes() async {
    String url = "http://localhost:8080/cliente";
    Response resposta = await get(Uri.parse(url));
    String jsonUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonUtf8);
    List<Cliente> listaClientes =
        List<Cliente>.from(l.map((e) => Cliente.fromJson(e)));
    return listaClientes;
  }

  Future<List<Cliente>> listaClientesPorCidade(int cidade) async {
    String url = "http://localhost:8080/cliente/buscaporcidade/$cidade";
    Response resposta = await get(Uri.parse(url));
    String jsonUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonUtf8);
    List<Cliente> listaClientes =
        List<Cliente>.from(l.map((e) => Cliente.fromJson(e)));
    return listaClientes;
  }

  Future<List<Cidade>> listaCidadePorUf(String uf) async {
    String url = "http://localhost:8080/cidade/buscauf/$uf";
    Response resposta = await get(Uri.parse(url));
    String jsonUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable l = json.decode(jsonUtf8);
    List<Cidade> listaCidades =
        List<Cidade>.from(l.map((e) => Cidade.fromJson(e)));
    return listaCidades;
  }

  Future<void> excluiCliente(int id) async {
    String url = "http://localhost:8080/cliente/$id";
    await delete(Uri.parse(url));
  }

  Future<void> excluiCidade(int id) async {
    String url = "http://localhost:8080/cidade/$id";
    await delete(Uri.parse(url));
  }

  Future<void> insereCidade(Map<String, dynamic> cidade) async {
    String url = "http://localhost:8080/cidade";
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    await post(Uri.parse(url), headers: headers, body: jsonEncode(cidade));
  }

  Future<void> alteraCidade(Map<String, dynamic> cidade) async {
    String url = "http://localhost:8080/cidade";
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    await put(Uri.parse(url), headers: headers, body: jsonEncode(cidade));
  }

  Future<void> insereCliente(Map<String, dynamic> cliente) async {
    String url = "http://localhost:8080/cliente";
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    await post(Uri.parse(url), headers: headers, body: jsonEncode(cliente));
  }

  Future<void> alteraCliente(Map<String, dynamic> cliente) async {
    String url = "http://localhost:8080/cliente";
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    await put(Uri.parse(url), headers: headers, body: jsonEncode(cliente));
  }
}
