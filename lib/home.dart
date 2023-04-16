import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // int _contador = 0;

  // _incrementar() {
  //   setState(() {
  //     _contador++;
  //   });
  // }

  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: Observer(builder: (_) {
            //       return Text(
            //         "${controller.contador}",
            //         style: const TextStyle(color: Colors.black, fontSize: 80),
            //       );
            //     })),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(labelText: "Email"),
                onChanged: controller.setEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(labelText: "Senha"),
                onChanged: controller.setSenha,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return Text(controller.formularioValidado
                      ? "Validado"
                      : "* Campos não validados");
                },
              ),
            ),

            Padding(
                padding: const EdgeInsets.all(16),
                child: Observer(builder: (_) {
                  return ElevatedButton(
                    onPressed: controller.formularioValidado
                        ? () {
                            //controller.incrementar();
                          }
                        : null,
                    child: const Text(
                      "Logar",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
