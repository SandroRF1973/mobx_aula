import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  ControllerBase() {
    autorun((_) {
      // ignore: avoid_print
      //print(email);
    });
  }

  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  bool usuarioLogado = false;

  @observable
  bool carregando = false;

  @computed
  String get emailSenha => "$email - $senha";

  @computed
  bool get formularioValidado => email.length >= 5 && senha.length >= 5;

  @action
  void setEmail(valor) => email = valor;

  @action
  void setSenha(valor) => senha = valor;

  @action
  Future<void> logar() async {
    carregando = true;

    await Future.delayed(const Duration(seconds: 3));

    carregando = false;
    usuarioLogado = true;
  }

  // @observable
  // int contador = 0;

  // @action
  // incrementar() {
  //   contador++;
  // }

  // final _contador = Observable(0);

  // late Action incrementar;

  // Controller() {
  //   incrementar = Action(_incrementar);
  // }

  // int get contador => _contador.value;
  // set contador(novoValor) => _contador.value = novoValor;

  // _incrementar() {
  //   // _contador.value = _contador.value + 1;
  //   contador++;
  // }
}
