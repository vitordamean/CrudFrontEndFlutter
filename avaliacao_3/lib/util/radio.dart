import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

enum sexoEmum { masculino, feminino }

class RadioSexo extends StatefulWidget {
  TextEditingController? controller;
  RadioSexo({Key? key, this.controller}) : super(key: key);

  @override
  State<RadioSexo> createState() => _RadioSexoState();
}

class _RadioSexoState extends State<RadioSexo> {
  sexoEmum? _escolha = sexoEmum.masculino;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: const Text('Masculino'),
            leading: Radio<sexoEmum>(
                value: sexoEmum.masculino,
                groupValue: _escolha,
                onChanged: (sexoEmum? value) {
                  setState(() {
                    _escolha = value;
                    widget.controller?.text = 'M';
                  });
                }),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text('Feminino'),
            leading: Radio<sexoEmum>(
                value: sexoEmum.feminino,
                groupValue: _escolha,
                onChanged: (sexoEmum? value) {
                  setState(() {
                    _escolha = value;
                    widget.controller?.text = 'F';
                  });
                }),
          ),
        ),
      ],
    );
  }
}
