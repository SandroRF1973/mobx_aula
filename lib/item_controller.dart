import 'package:mobx/mobx.dart';
part 'item_controller.g.dart';

class ItemController = ItemControllerBase with _$ItemController;

abstract class ItemControllerBase with Store {
  ItemControllerBase(this.titulo);

  final String titulo;

  @observable
  bool marcado = false;

  void alterarMarcado(bool? valor) => marcado = valor!;
}
