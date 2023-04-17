import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/principal_controller.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final PrincipalController _principalController = PrincipalController();

  _dialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Adicionar item"),
            content: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite uma descrição..."),
              onChanged: _principalController.setNovoItem,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    _principalController.adicionarItem();
                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tarefas",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _principalController.listaItens.length,
            itemBuilder: (_, indice) {
              //item é do tipo ItemController
              var item = _principalController.listaItens[indice];
              return Observer(builder: (_) {
                return ListTile(
                  title: Text(
                    item.titulo,
                    style: TextStyle(
                        decoration:
                            item.marcado ? TextDecoration.lineThrough : null),
                  ),
                  leading: Checkbox(
                    value: item.marcado,
                    onChanged: item.alterarMarcado,
                  ),
                  onTap: () {
                    item.marcado = !item.marcado;
                  },
                );
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
