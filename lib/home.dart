import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/principal.dart';

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
  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // autorun((_) {
    //   // ignore: avoid_print
    //   print(controller.formularioValidado);
    // });

    reactionDisposer =
        reaction((_) => controller.usuarioLogado, (usuarioLogado) {
      if (usuarioLogado) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => Principal()));
      }
    });
  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

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
                            controller.logar();
                          }
                        : null,
                    child: controller.carregando
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : const Text(
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
